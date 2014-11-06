class AddAddress2ToInterns < ActiveRecord::Migration
  def change
    add_column :interns, :address2, :string
  end
end
