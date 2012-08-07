class Post < ActiveRecord::Base

  belongs_to :user
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :projects

  attr_accessible :title,:user_id,:body,:imagelink,:category_ids,:project_ids

end
