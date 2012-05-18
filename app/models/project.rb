class Project < ActiveRecord::Base
  acts_as_gmappable :process_geocoding => false
  
  def gmaps4rails_address
    "#{self.latitude}, #{self.longitude}"
  end
  
  def gmaps4rails_title
    "#{self.projectname}"
  end
  
  def gmaps4rails_infowindow
      "<h1>#{self.projectname}</h1><div>#{self.description}</div><div>Completion: #{self.completion}</div>"
  end
end
