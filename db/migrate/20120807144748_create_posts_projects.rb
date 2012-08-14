class CreatePostsProjects < ActiveRecord::Migration
  def change
    create_table :posts_projects, :id => false do |t|
      t.integer :post_id
      t.integer :project_id
    end
  end
end
