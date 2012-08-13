class Post < ActiveRecord::Base

  has_many :assets
  belongs_to :user
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :communities
  has_and_belongs_to_many :projects

  attr_accessible :title,:user_id,:body,:imagelink,:category_ids,:project_ids,:assets_attributes,:author,:postdate
  
  accepts_nested_attributes_for :assets, :allow_destroy => true

end
