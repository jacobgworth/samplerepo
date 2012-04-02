class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :projectname
      t.float :latitude
      t.float :longitude
      t.date :completion
      t.string :description

      t.timestamps
    end
  end
end
