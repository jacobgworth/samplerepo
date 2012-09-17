class Community < ActiveRecord::Base
  
  has_many :assets
  
  has_and_belongs_to_many :experiences
  
  has_and_belongs_to_many :partners
  
  has_and_belongs_to_many :posts
  
  has_and_belongs_to_many :projects
  
  has_and_belongs_to_many :updates
  
  
  acts_as_gmappable :process_geocoding => false
  
  accepts_nested_attributes_for :assets, :allow_destroy => true
  
  def gmaps4rails_address
    "#{self.latitude}, #{self.longitude}"
  end
  
  def gmaps4rails_title
    "#{self.communityname}"
  end
    
end
