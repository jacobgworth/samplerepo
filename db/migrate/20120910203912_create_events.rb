class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :eventname
      t.text :description
      t.string :location
      t.date :eventdate
      t.timestamps
    end
  end
end
