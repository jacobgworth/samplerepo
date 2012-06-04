class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string,content :url

      t.timestamps
    end
  end
end
