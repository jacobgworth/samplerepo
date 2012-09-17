class AddCommunityIdToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :community_id, :integer
  end
end
