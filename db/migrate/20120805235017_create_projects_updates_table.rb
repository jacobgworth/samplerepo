class CreateProjectsUpdatesTable < ActiveRecord::Migration
  def change
    create_table :projects_updates, :id => false do |t|
      t.integer :project_id
      t.integer :update_id
    end
  end
end
