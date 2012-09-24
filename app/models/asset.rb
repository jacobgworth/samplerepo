class Asset < ActiveRecord::Base

  belongs_to :project
  belongs_to :post
  belongs_to :community
  
  #Paperclip method for Experience images
  has_attached_file :asset, 
    :storage => :s3,
    :bucket => "MOH",
    :s3_credentials => "#{Rails.root}/config/s3_credentials.yml",
    :styles => { :large => "600", :medium => "300", :thumb => "123x123#"}
    
  validates_attachment_content_type :asset, :content_type => ['image/jpeg', 'image/png']

end
