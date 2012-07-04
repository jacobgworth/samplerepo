class AddGoalsAndProgressAndFundsneededAndFundsraisedAndStartdateToProject < ActiveRecord::Migration
  def change
    add_column :projects, :goal, :string
    add_column :projects, :progress, :decimal
    add_column :projects, :fundsneeded, :decimal
    add_column :projects, :fundsraised, :decimal
    add_column :projects, :startdate, :date
  end
end
