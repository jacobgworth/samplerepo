class AddPercentcompleteToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :percentcomplete, :integer
  end
end
