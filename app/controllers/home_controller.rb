class HomeController < ApplicationController
  def index
    @updates = Update.all
  end

end
