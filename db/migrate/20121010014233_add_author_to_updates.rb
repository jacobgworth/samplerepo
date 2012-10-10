class AddAuthorToUpdates < ActiveRecord::Migration
  def change
    add_column :updates, :author, :string
  end
end
