class AddPairedListIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :paired_list_id, :integer
  end
end
