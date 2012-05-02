class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :users, :password_rest_sent_at, :password_reset_sent_at
  end
end
