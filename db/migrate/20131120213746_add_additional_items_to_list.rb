class AddAdditionalItemsToList < ActiveRecord::Migration
  def change
    add_column :lists, :item2, :string
    add_column :lists, :item3, :string
    add_column :lists, :item4, :string
    add_column :lists, :item5, :string
    add_column :lists, :item6, :string
    add_column :lists, :item7, :string
    add_column :lists, :item8, :string
    add_column :lists, :item9, :string
    add_column :lists, :item10, :string
  end
end
