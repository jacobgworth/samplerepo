class Project < ActiveRecord::Base
  acts_as_gmappable :process_geocoding => false
  
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
