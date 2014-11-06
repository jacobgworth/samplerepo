class AddRefnamesToIntern < ActiveRecord::Migration
  def change
    add_column :interns, :ref1_last_name, :string
    add_column :interns, :ref2_last_name, :string
    add_column :interns, :ref3_last_name, :string
    add_column :interns, :ref4_last_name, :string
  end
end
