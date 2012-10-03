class AddMetasToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :metatitle, :string
    add_column :posts, :metadescription, :string
  end
end
