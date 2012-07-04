class Community < ActiveRecord::Base
  
  has_and_belongs_to_many :projects
  
  acts_as_gmappable :process_geocoding => false
  
  def gmaps4rails_address
    "#{self.latitude}, #{self.longitude}"
  end
  
  def gmaps4rails_title
    "#{self.communityname}"
  end
    
end
