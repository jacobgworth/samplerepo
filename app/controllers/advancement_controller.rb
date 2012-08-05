class AdvancementController < ApplicationController
  def index
    @updates=Update.all
      respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end
end