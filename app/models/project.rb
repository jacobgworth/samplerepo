class Project < ActiveRecord::Base
  acts_as_gmappable :process_geocoding => false
  
  has_and_belongs_to_many :partners
  
  has_and_belongs_to_many :communities
  
  has_and_belongs_to_many :experiences
  
  attr_accessible :photo,:projectname,:latitude,:longitude,:completion,:description
  
  #Paperclip method for group avatar
  has_attached_file :photo, 
    :storage => :s3,
    :bucket => "MOH",
    :s3_credentials => "#{Rails.root}/config/s3_credentials.yml",
    :styles => { :large => "300x300#", :medium => "160x160#", :thumb => "90x90#"}
    
   validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
  
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
