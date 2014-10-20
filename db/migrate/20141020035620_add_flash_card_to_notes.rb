class AddFlashCardToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :flash_card, :boolean, default: false
  end
end
