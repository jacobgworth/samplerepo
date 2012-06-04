class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :url
      t.text :content
      t.string :headline
      t.string :description
      t.string :title

      t.timestamps
    end
  end
end
