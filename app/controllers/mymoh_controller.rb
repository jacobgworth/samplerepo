class MymohController < ApplicationController
  include Databasedotcom::Rails::Controller
  
  def account
    respond_to do |format|
      format.html {render :layout=>"homeLayout"} 
    end
  end
end
