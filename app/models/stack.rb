class Stack < ActiveRecord::Base
  has_and_belongs_to_many :notes

  scope :recently_updated_first, lambda { order("stack.notes.updated_at DESC")}

  scope :sort_by_id, lambda {order("id ASC")}

  def to_param
    "#{id}-#{title.parameterize}"
  end

end