class Experience < ActiveRecord::Base
  
  belongs_to :users
  
  has_and_belongs_to_many :projects
  
  has_and_belongs_to_many :communities
  
end
