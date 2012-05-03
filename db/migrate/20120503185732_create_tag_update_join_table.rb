class CreateTagUpdateJoinTable < ActiveRecord::Migration
  def change
    create_table :tags_updates, :id => false do |t|
      t.integer :tag_id
      t.integer :update_id
    end
  end
end
