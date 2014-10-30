class CreateFlashcards < ActiveRecord::Migration
  def change
    create_table :flashcards do |t|
      t.references :user, index: true
      t.references :note, index: true

      t.timestamps
    end
  end
end
