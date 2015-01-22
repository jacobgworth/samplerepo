class ChangeStringTypesInInterns < ActiveRecord::Migration
  def change
    change_column :interns, :education_other, :text
    change_column :interns, :other_schools, :text
    change_column :interns, :mission_experience, :text
    change_column :interns, :health_description, :text
    change_column :interns, :certifications, :text
  end
end
