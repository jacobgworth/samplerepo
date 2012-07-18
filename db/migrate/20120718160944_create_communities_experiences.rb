class CreateCommunitiesExperiences < ActiveRecord::Migration
  def change
    create_table :communities_experiences, :id => false do |t|
      t.integer :community_id
      t.integer :experience_id
    end
  end
end
