class HomeController < ApplicationController
  def index
    @updates = Update.last(3).reverse
  end

end
