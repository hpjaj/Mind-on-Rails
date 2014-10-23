class AddPublicToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :public, :boolean, default: false
  end
end