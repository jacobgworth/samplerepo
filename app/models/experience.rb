class Experience < ActiveRecord::Base
  
  belongs_to :users
  
  has_many :assets
  
  attr_accessible :headline,:summary,:description,:user_id,:assets_attributes
  
  accepts_nested_attributes_for :assets, :allow_destroy => true
  
  
  has_and_belongs_to_many :projects
  
  has_and_belongs_to_many :communities
  
  
  
  
end
