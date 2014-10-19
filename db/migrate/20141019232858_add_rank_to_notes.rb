class AddRankToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :rank, :float
  end
end
