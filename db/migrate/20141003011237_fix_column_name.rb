class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :stacks, :body, :description
  end
end
