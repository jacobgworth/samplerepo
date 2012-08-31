class TakeActionController < ApplicationController
  def index
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# three_cords.html.erb
    end
  end
end
