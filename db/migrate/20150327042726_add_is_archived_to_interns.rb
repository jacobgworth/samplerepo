class AddIsArchivedToInterns < ActiveRecord::Migration
  def change
    add_column :interns, :is_archived, :bool
  end
end
