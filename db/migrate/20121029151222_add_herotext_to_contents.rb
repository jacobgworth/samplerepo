class AddHerotextToContents < ActiveRecord::Migration
  def change
    add_column :contents, :herotext, :string
  end
end
