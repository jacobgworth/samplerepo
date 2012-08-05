class AddCategoryiconToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :categoryicon, :string
  end
end
