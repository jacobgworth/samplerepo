class HomeController < ApplicationController

layout "homeLayout"

  def index
    @title = "Mission of Hope, Haiti (MOH) - Hope For The Nation of Haiti"
    @meta = "We strive to meet the physical & spiritual needs of the Haitian population. View our ministries and get involved with Church Partnerships, Mission Trips or Child Sponsorships."
    @updates = Update.order("postdate desc").take(3)
  end

end
