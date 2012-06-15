class Content < ActiveRecord::Base

  validates_uniqueness_of :url

  def to_param
    url
  end

end
