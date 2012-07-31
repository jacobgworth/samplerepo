class CreateCategories < ActiveRecord::Migration
   def change
    create_table :categories do |t|
      t.string :categoryname
      t.references :categorizable, :polymorphic => true
      t.timestamps
    end
  end
end
