class AddHeroimageToCommunities < ActiveRecord::Migration
  def change
    add_column :communities, :heroimage, :string
  end
end
