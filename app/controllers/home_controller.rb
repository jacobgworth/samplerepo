class HomeController < ApplicationController

layout "homeLayout"

  def index
    @updates = Update.last(3).reverse
  end

end
