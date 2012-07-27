class AddStageToProject < ActiveRecord::Migration
  def change
    add_column :projects, :stage, :string
  end
end
