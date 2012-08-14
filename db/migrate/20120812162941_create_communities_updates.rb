class CreateCommunitiesUpdates < ActiveRecord::Migration
  def change
    create_table :communities_updates, :id => false do |t|
      t.integer :community_id
      t.integer :update_id
    end
  end
end
