class Category < ActiveRecord::Base

  has_and_belongs_to_many :projects
  has_and_belongs_to_many :posts
  has_and_belongs_to_many :updates

end
