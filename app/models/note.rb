class Note < ActiveRecord::Base

  include PgSearch
  
  belongs_to :user
  has_and_belongs_to_many :stacks

  scope :recently_updated_first, lambda { order("notes.updated_at DESC")}
  scope :only_this_users_notes, -> (user) { where(user_id: user.id) }

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

  def self.perform_search(options)
    query = options[:query]
    page = options[:page]
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

    notes = notes.paginate(page: page, per_page: 5).recently_updated_first

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

end
