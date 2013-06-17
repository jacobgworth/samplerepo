class Subscription < ActiveRecord::Base
  attr_accessible :sub_id, :type, :user_id
end
