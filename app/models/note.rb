class Note < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :stacks

  scope :recently_updated_first, lambda { order("notes.updated_at DESC")}

  validates :title, length: { minimum: 5, too_short: "Minimum length of 5 characters" }
  validates :body, length: { minimum: 15, too_short: "Minimum length of 15 characters" }
  validates :stacks, :presence => { :message => "Choose at least 1 stack" }

  # validate do |note|
  #   note.errors.add(:base, "Choose at least 1 stack") if stacks.present?
  # end


end
