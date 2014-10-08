class Note < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :stacks

  scope :recently_updated_first, lambda { order("notes.updated_at DESC")}
end
