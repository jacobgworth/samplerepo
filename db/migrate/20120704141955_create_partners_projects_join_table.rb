class CreatePartnersProjectsJoinTable < ActiveRecord::Migration
  def change
    create_table :partners_projects, :id => false do |t|
      t.integer :partner_id
      t.integer :project_id
    end
  end
end
