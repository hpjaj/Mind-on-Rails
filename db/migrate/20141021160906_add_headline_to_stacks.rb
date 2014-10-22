class AddHeadlineToStacks < ActiveRecord::Migration
  def change
    add_column :stacks, :headline, :string
  end
end
