class AddThumbToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :thumb_id, :integer
  end
end
