class AddLastNamesToIntern < ActiveRecord::Migration
  def change
    add_column :interns, :father_last_name, :string
    add_column :interns, :mother_last_name, :string
  end
end
