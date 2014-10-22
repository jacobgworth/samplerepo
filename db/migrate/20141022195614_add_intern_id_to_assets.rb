class AddInternIdToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :intern_id, :integer
  end
end
