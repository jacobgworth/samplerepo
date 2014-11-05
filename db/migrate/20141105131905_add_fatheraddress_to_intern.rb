class AddFatheraddressToIntern < ActiveRecord::Migration
  def change
    add_column :interns, :father_address_2, :string
    add_column :interns, :mother_address_2, :string
  end
end
