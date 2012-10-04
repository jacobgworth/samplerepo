class AddThumblinkToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :thumblink, :string
  end
end
