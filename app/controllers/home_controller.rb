class HomeController < ApplicationController

layout "homeLayout"

  def index
    @updates = Update.order("postdate desc").take(3)
  end

end
