class CreateCategoriesUpdates < ActiveRecord::Migration
  def change
    create_table :categories_updates, :id => false do |t|
      t.integer :category_id
      t.integer :update_id
    end
  end
end
