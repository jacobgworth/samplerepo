class Project < ActiveRecord::Base
  has_one :project_type

  # Examples of validations.
  validates_presence_of :team_leader, :team_name, :project_type
end