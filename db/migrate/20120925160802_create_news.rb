class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :headline
      t.text :bodycontent
      t.datetime :postdate

      t.timestamps
    end
  end
end
