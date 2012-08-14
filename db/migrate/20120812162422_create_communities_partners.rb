class CreateCommunitiesPartners < ActiveRecord::Migration
  def change
    create_table :communities_partners, :id => false do |t|
      t.integer :community_id
      t.integer :partner_id
    end
  end
end
