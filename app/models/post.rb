class Post < ActiveRecord::Base

  belongs_to :user
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :projects

  attr_accessible :project_ids

end
