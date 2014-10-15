class Note < ActiveRecord::Base

  include PgSearch
  
  belongs_to :user
  has_and_belongs_to_many :stacks

  scope :recently_updated_first, lambda { order("notes.updated_at DESC")}

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

end
