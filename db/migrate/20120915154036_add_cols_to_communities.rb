class AddColsToCommunities < ActiveRecord::Migration
  def change
    add_column :communities, :overviewtitle, :string
    add_column :communities, :overviewdesc, :text
    add_column :communities, :spiritualtitle, :string
    add_column :communities, :spiritualdesc, :text
    add_column :communities, :econtitle, :string
    add_column :communities, :econdesc, :text
    add_column :communities, :edtitle, :string
    add_column :communities, :eddesc, :text
    add_column :communities, :healthtitle, :string
    add_column :communities, :healthdesc, :text
    add_column :communities, :needstitle, :string
    add_column :communities, :needsdesc, :text
  end
end
