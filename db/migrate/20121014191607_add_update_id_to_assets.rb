class AddUpdateIdToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :update_id, :integer
  end
end
