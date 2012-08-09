class FixAuthtokenColumnname < ActiveRecord::Migration
  def change
    rename_column :users, :authtoken, :auth_token
  end
end
