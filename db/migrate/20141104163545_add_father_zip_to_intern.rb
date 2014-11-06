class AddFatherZipToIntern < ActiveRecord::Migration
  def change
    add_column :interns, :father_zip, :string
    add_column :interns, :mother_zip, :string
  end
end
