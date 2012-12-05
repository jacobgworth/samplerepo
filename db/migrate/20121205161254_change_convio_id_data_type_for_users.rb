class ChangeConvioIdDataTypeForUsers < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.change :convio_id, :string
    end
  end

  def down
    change_table :users do |t|
      t.change :convio_id, :integer
    end
  end
end
