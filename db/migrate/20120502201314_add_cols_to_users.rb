class AddColsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password_hash, :string
    add_column :users, :password_salt, :string
    add_column :users, :authtoken, :string
    add_column :users, :password_reset_token, :string
    add_column :users, :password_rest_sent_at, :timestamp
  end
end
