class CreateExperiencesProjects < ActiveRecord::Migration
  def change
    create_table :experiences_projects, :id => false do |t|
      t.integer :experience_id
      t.integer :project_id
    end
  end
end
