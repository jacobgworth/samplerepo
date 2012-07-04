class CreateCommunitiesProjects < ActiveRecord::Migration
  def change
    create_table :communities_projects, :id => false do |t|
      t.integer :community_id
      t.integer :project_id
    end
  end
end
