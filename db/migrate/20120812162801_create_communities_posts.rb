class CreateCommunitiesPosts < ActiveRecord::Migration
  def change
    create_table :communities_posts, :id => false do |t|
      t.integer :community_id
      t.integer :post_id
    end
  end
end
