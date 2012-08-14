class AddPopulationToCommunities < ActiveRecord::Migration
  def change
    add_column :communities, :population, :integer
  end
end
