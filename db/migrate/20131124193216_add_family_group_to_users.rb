class AddFamilyGroupToUsers < ActiveRecord::Migration
  def change
    add_column :users, :family_group, :string
  end
end
