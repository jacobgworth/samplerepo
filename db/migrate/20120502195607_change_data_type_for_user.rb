class ChangeDataTypeForUser < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.change :user_name, :string
      t.change :convio_primary_email, :string
      t.change :email, :string
      t.change :first, :string
      t.change :last, :string
      t.change :street1, :string
      t.change :city, :string
      t.change :state, :string
      t.change :zip, :string
      t.change :convio_authtoken, :string
    end
  end

  def down
    change_table :users do |t|
      t.change :user_name, :text
      t.change :convio_primary_email, :text
      t.change :email, :text
      t.change :first, :text
      t.change :last, :text
      t.change :street1, :text
      t.change :city, :text
      t.change :state, :text
      t.change :zip, :text
      t.change :convio_authtoken, :text
     end
  end
end
