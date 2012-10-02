class AddAuthorToExperiences < ActiveRecord::Migration
  def change
    add_column :experiences, :author, :string
  end
end
