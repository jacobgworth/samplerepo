class SponsorshipController < ApplicationController
  def index
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end

end
