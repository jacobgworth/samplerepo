class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user
  
  private
  #def current_user
  #  @current_user ||= User.find(session[:user_id]) if session[:user_id]
  #end
  
  def current_user
    if cookies[:auth_token] != nil
      session[:user_id] = User.find_by_auth_token!(cookies[:auth_token]).id
      @current_user = User.find_by_auth_token!(cookies[:auth_token]) 
    else
      if session[:user_id] != nil
        @current_user = User.find(session[:user_id])
        cookies[:auth_token] = @current_user.auth_token
      else
        @current_user = nil
      end
    end
  end
  
  def is_logged_in?
    if session[:user_id] != nil || cookies[:auth_token] != nil
      session[:user_id] = User.find_by_auth_token(cookies[:auth_token]).id if cookies[:auth_token]
      return true
    else
      return false
    end
    
  end
  
  def is_admin_user?
    if is_logged_in?
      if current_user().email == "dsdewhir@gmail.com" || current_user().email == "david@threetwelvecreative.com" ||  current_user().email == "nmdewhirst@gmail.com" || current_user().email == "lindsey@mohhaiti.org" 
        return true
      else
        return false
      end
    else
      return false
    end
  end
  
  
end
