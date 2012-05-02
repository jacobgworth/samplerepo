class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :user_name
      t.integer :convio_id
      t.text :convio_primary_email
      t.text :email
      t.text :first
      t.text :last
      t.text :street1
      t.text :city
      t.text :state
      t.text :zip
      t.text :convio_authtoken

      t.timestamps
    end
  end
end
