class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :note

  validates :value, inclusion: { in: [-1, 1], message: "%{value} is not a valid vote." }

  after_save :update_note

  private

  def update_note
    note.update_rank
  end
end
