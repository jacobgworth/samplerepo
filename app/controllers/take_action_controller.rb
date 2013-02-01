class TakeActionController < ApplicationController
  def index
    @title = "Take Action | How to Help Mission of Hope, Haiti"
    @meta = "Do you want to take action and help Mission of Hope, Haiti create awareness or raise funds? There are so many ways you can help!"
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# three_cords.html.erb
    end
  end
end
