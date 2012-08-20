class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string,description :eventname

      t.timestamps
    end
  end
end
