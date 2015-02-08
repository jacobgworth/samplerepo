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
      
      @token = convio_authtoken_fetch user.email
      if @token && @token != "Token failure"
        user.convio_authtoken = @token
        user.save!
      end
    
      if !user.is_admin?
        redirect_to "http://mohh.convio.net/site/CRConsAPI?method=singleSignOn&api_key=mohhapi&v=1.0&error_redirect=http://mohhaiti.org&success_redirect=http://www.mohhaiti.org/mymoh/home&sso_auth_token=#{user.convio_authtoken}&remember_me=true"
        #redirect_to "https://secure3.convio.net/mohh/site/CRConsAPI?method=singleSignOn&api_key=mohhapi&v=1.0&error_redirect=http://mohhaiti.org/mymoh&success_redirect=http://www.mohhaiti.org/mymoh&sso_auth_token=#{user.convio_authtoken}&remember_me=true"
        #redirect_to "/mymoh", :notice => "Logged in!"
      else
        redirect_to "https://secure3.convio.net/mohh/site/CRConsAPI?method=singleSignOn&api_key=mohhapi&v=1.0&error_redirect=http://mohhaiti.org&success_redirect=http://www.mohhaiti.org/mymoh/home&sso_auth_token=#{user.convio_authtoken}&remember_me=true"
        #redirect_to "https://secure3.convio.net/mohh/site/CRConsAPI?method=singleSignOn&api_key=mohhapi&v=1.0&error_redirect=http://mohhaiti.org/mymoh&success_redirect=http://www.mohhaiti.org/console&sso_auth_token=#{user.convio_authtoken}&remember_me=true"
        #redirect_to "/console"
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
