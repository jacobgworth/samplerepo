class Asset < ActiveRecord::Base

  belongs_to :experience
  
  #Paperclip method for Experience images
  has_attached_file :asset, 
    :storage => :s3,
    :bucket => "MOH",
    :s3_credentials => "#{Rails.root}/config/s3_credentials.yml",
    :styles => { :large => "600x600#", :medium => "300x300#", :thumb => "90x90#"}
    
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

end
