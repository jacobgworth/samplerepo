class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.string :partnername
      t.string :partnerURL

      t.timestamps
    end
  end
end
