class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.string :title
      t.string :body
      t.string :media

      t.timestamps
    end
  end
end
