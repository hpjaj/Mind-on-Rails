class Note < ActiveRecord::Base

  include PgSearch
  
  belongs_to :user
  has_and_belongs_to_many :stacks
  has_many :votes, dependent: :destroy

  scope :recently_updated_first, lambda { order("notes.updated_at DESC")}
  scope :only_this_users_notes, -> (user) { where(user_id: user.id) }

  scope :rank_by_vote_count, lambda { order('rank DESC') }

  validates :title, length: { minimum: 5, too_short: " - Minimum length of 5 characters" }
  validates :body, length: { minimum: 5, too_short: " - Minimum length of 5 characters" }
  validates :stacks, :presence => { :message => " - Choose at least 1 stack" }

  pg_search_scope :search, against: [:title, :body],
    using: {tsearch: {dictionary: "english"}},
    associated_against: {stacks: [:title]}

  def self.text_search(query)
    if query.present?
      search(query)
    else
      where(nil)
    end
  end

  PER_PAGE_DEFAULT = 5

  def self.perform_search(options)
    query = options[:query]
    page = options[:page]
    per_page = options[:per_page] || PER_PAGE_DEFAULT
    user = options[:user]
    stack = options[:stack]
    only_user_owned_notes = options[:only_user_owned_notes]

    notes = nil

    if stack
      notes = stack.notes
    else
      notes = Note.all
    end

    if query
      notes = notes.text_search(query)
    end

    notes = notes.paginate(page: page, per_page: per_page).recently_updated_first

    if user
      if only_user_owned_notes
        notes = notes.where(user: user)
      else  
        notes = notes.where("user_id = ? OR private = ?", user.id, false)
        # notes = notes.where(user_id: user.id)
      end
    else
      notes = notes.where(private: false)
    end
    notes
  end

  def up_votes
    votes.where(value: 1).count
  end

  def down_votes
    votes.where(value: -1).count
  end

  def points
    votes.sum(:value)
  end

  def update_rank
    age = (created_at - Time.new(1970,1,1)) / (60 * 60 * 24) # 1 day in seconds
    new_rank = points + age

    update_attribute(:rank, new_rank)
  end

  def to_param
    "#{id}-#{title.parameterize}"
  end

end
