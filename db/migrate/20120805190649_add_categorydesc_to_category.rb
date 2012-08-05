class AddCategorydescToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :categorydesc, :string
  end
end
