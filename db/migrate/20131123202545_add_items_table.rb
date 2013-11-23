class AddItemsTable < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.belongs_to :list
      t.string :item
    end
  end
end
