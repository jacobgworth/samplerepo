class HomeController < ApplicationController
  def index
    @updates = Update.last(3)
  end

end
