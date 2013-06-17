class AddConvioUrlToEvents < ActiveRecord::Migration
  def change
    add_column :events, :conviourl, :text
  end
end
