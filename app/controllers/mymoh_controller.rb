class MymohController < ApplicationController
  include Databasedotcom::Rails::Controller
  
  def account
    @account = Contact.find_by_name("Lindsey Rubino")
    respond_to do |format|
      format.html {render :layout=>"homeLayout"} 
    end
  end
  
  def new
    if request.method == "POST"
       
    else
       @user = User.new 
       
       respond_to do |format|
         format.html #new.html.erb
       end
    end
  end
end