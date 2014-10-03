class CreateStacks < ActiveRecord::Migration
  def change
    create_table :stacks do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
