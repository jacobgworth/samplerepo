class Project < ActiveRecord::Base
  
  acts_as_gmappable :process_geocoding => false
  
  has_many :assets
  
  has_and_belongs_to_many :categories
  
  has_and_belongs_to_many :communities
  
  has_and_belongs_to_many :experiences
  
  has_and_belongs_to_many :posts
  
  has_and_belongs_to_many :partners
  
  has_and_belongs_to_many :updates
  
  attr_accessible :projectname,:latitude,:longitude,:completion,:description,:assets_attributes,:stage,:fundsneeded,:fundsraised,:goal,:category_ids,:percentcomplete,:community_ids,:heroimage
  
  accepts_nested_attributes_for :assets, :allow_destroy => true
  
  validates_length_of :goal, :minimum => 1, :maximum => 160, :allow_blank => true
  validates :percentcomplete, :numericality => { :only_integer => true },:allow_blank=>true
  
  
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
