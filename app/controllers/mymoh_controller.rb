class MymohController < ApplicationController
  include Databasedotcom::Rails::Controller
  
  def account
    @account = Contact.find_by_name("Lindsey Rubino")
    respond_to do |format|
      format.html {render :layout=>"homeLayout"} 
    end
  end
  
end