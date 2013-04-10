class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :user_id
      t.text :type
      t.integer :sub_id

      t.timestamps
    end
  end
end
