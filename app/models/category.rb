class Category < ActiveRecord::Base

  belongs_to: :categorizable, :polymorphic => true

end
