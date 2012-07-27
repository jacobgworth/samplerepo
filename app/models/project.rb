class Project < ActiveRecord::Base
  
  acts_as_gmappable :process_geocoding => false
  
  has_many :assets
  
  has_and_belongs_to_many :partners
  
  has_and_belongs_to_many :communities
  
  has_and_belongs_to_many :experiences
  
  attr_accessible :projectname,:latitude,:longitude,:completion,:description,:assets_attributes,:stage
  
  accepts_nested_attributes_for :assets, :allow_destroy => true
  
  
  
  def gmaps4rails_address
    "#{self.latitude}, #{self.longitude}"
  end
  
  def gmaps4rails_title
    "#{self.projectname}"
  end
  
  def gmaps4rails_infowindow
      "<h4>#{self.projectname}</h4><p>#{self.description}</p><p>Completion: #{self.completion}</p>"
  end
end
