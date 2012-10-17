class ChangeBodyToText < ActiveRecord::Migration
  def up
    change_column :updates, :body, :text
  end

  def down
    change_column :updates, :body, :string
  end
end
