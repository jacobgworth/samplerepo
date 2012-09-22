class AddCategoryheroToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :categoryhero, :string
  end
end
