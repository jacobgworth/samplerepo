class AddHeroimageToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :heroimage, :string
  end
end
