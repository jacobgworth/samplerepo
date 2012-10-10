class AddPostdateToUpdates < ActiveRecord::Migration
  def change
    add_column :updates, :postdate, :datetime
  end
end
