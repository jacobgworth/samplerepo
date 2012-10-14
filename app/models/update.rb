class Update < ActiveRecord::Base

  has_many :assets
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :communities
  has_and_belongs_to_many :projects
  has_and_belongs_to_many :tags
  belongs_to :user
  

  accepts_nested_attributes_for :assets, :allow_destroy => true


end
