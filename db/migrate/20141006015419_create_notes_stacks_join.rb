class CreateNotesStacksJoin < ActiveRecord::Migration
  def change
    create_table :notes_stacks, :id => false do |t|
      t.integer "note_id"
      t.integer "stack_id"
    end
    add_index :notes_stacks, ["note_id", "stack_id"]
  end
end
