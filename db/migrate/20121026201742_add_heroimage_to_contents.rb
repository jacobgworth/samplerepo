class AddHeroimageToContents < ActiveRecord::Migration
  def change
    add_column :contents, :heroimage, :string
  end
end
