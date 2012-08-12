class Update < ActiveRecord::Base

  has_and_belongs_to_many :categories
  has_and_belongs_to_many :communities
  has_and_belongs_to_many :projects
  has_and_belongs_to_many :tags
  belongs_to :user

end
