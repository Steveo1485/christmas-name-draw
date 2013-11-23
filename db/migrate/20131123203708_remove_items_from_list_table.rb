class RemoveItemsFromListTable < ActiveRecord::Migration
  def change
    remove_column :lists, :item1
    remove_column :lists, :item2
    remove_column :lists, :item3
    remove_column :lists, :item4
    remove_column :lists, :item5
    remove_column :lists, :item6
    remove_column :lists, :item7
    remove_column :lists, :item8
    remove_column :lists, :item9
    remove_column :lists, :item10
  end
end
