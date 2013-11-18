class AddItem1ToListsTable < ActiveRecord::Migration
  def change
    add_column :lists, :item1, :string
  end
end
