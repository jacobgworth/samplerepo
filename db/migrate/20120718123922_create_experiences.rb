class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :headline
      t.string :summary
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
