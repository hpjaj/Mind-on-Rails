class DropStacks < ActiveRecord::Migration
  def change
    drop_table :stacks
  end
end
