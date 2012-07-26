class Experience < ActiveRecord::Base
  
  belongs_to :users
  
  has_many :assets
  
  attr_accessible :headline,:summary,:description,:user_id,:assets_attributes
  
  accepts_nested_attributes_for :assets, :allow_destroy => true
  
  
  has_and_belongs_to_many :projects
  
  has_and_belongs_to_many :communities
  
  
  has_attached_file :photo, 
    :storage => :s3,
    :bucket => "MOH",
    :s3_credentials => "#{Rails.root}/config/s3_credentials.yml",
    :styles => { :large => "300x300#", :medium => "160x160#", :thumb => "90x90#"}
    
   validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
  
  
end
