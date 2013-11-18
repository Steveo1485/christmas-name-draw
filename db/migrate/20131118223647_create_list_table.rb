class CreateListTable < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.belongs_to :user
    end
  end
end
