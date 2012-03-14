class CreateCommunities < ActiveRecord::Migration
  def change
    create_table :communities do |t|
      t.string :communityname
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
