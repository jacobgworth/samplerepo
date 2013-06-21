class SessionsController < ApplicationController
  
  layout "homeLayout"
  
  def new
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}
    end
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      cookies[:auth_token] = user.auth_token
      if !user.is_admin?
        redirect_to "/mymoh", :notice => "Logged in!"
      else
        redirect_to "/console"
      end
    else
      flash.now.alert = "Invalid email or password."
      render "new"
    end
  end
  
  def destroy
    session[:user_id] = nil
    cookies.delete(:auth_token)
    redirect_to root_url, :notice => "Logged out!"
  end
  
end
