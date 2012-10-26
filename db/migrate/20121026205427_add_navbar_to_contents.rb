class AddNavbarToContents < ActiveRecord::Migration
  def change
    add_column :contents, :navbar, :string
  end
end
