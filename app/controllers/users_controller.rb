class UsersController < ApplicationController
  placeholder = Community
  include Databasedotcom::Rails::Controller
  Community = placeholder
  
  # GET /users
  # GET /users.json
  def index
    if is_admin_user?
      @users = User.all

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @users }
      end
    else
      respond_to do |format|
        format.html { redirect_to "/" }
      end
    end
  end
  
  def password_reset
    if params[:email]
      user = User.find_by_email(params[:email])
      user.send_password_reset if user
      @message = "We've recieved your request for a password reset. Please check your email."
    end
    respond_to do | format |
      format.html { render :layout => "homeLayout" }
    end
  end
  
  def password_reset_edit
    @user = User.find_by_password_reset_token!(params[:token])
    if params[:user]
      if @user.password_reset_sent_at < 2.hours.ago
        redirect_to "/users/password_reset", notice: "Password reset has expired."
      elsif @user.update_attributes(params[:user])
        redirect_to "/mymoh/login", notice: "Password has been reset."
      else
        render :password_reset_edit, :layout => "homeLayout"
      end
    else
      respond_to do |format|
        format.html { render :layout => "homeLayout" }
      end
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    if is_admin_user?

      respond_to do |format|
        format.html { render :layout => "homeLayout" }# show.html.erb
        format.json { render json: @user }
      end
    else
       respond_to do |format|
        format.html { redirect_to "/mymoh/account" }
       end
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
      @user = User.new
      #@contact = Contact.new
      respond_to do |format|
        format.html { render :layout => "homeLayout"}# new.html.erb
        format.json { render json: @user }
      end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    if is_admin_user? || @user == current_user
      @contact = Contact.find(@user.convio_id)
      #@interests = @user.get_interests
      begin
        @interests = current_user.get_interests
      rescue
        @interests = []
      end
      if (@contact == nil)
        @contact = Contact.new
      end
      respond_to do |format|
        format.html { render :layout => "homeLayout" }
      end
    else
      respond_to do |format|
        format.html { redirect_to "/" }
      end
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        cookies[:auth_token] = @user.auth_token
        format.html { redirect_to "/mymoh", notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
    if is_admin_user? || @user == current_user
      #@contact = Contact.find_by_Id(@user.convio_id)
  
      respond_to do |format|
        if @user.update_attributes(params[:user])
          @cont = Contact.find_by_ID(@user.convio_id) unless @user.convio_id.nil?
          if (@cont)
            puts "Phone: " + params[:user][:phone]
            @cont.Phone = params[:user][:phone]
            @cont.save
            if params[:all_preferences]
              params[:comm_newsletter] = "checked"
              params[:comm_important] = "checked"
              params[:comm_monthlygifts] = "checked"
              params[:comm_campaign] = "checked"
            end
            @cont.Newsletter__c = (params[:comm_newsletter] ? true : false)
            @cont.Important_Announcements__c = (params[:comm_important] ? true : false)
            @cont.Monthly_Gift_Statements__c = (params[:comm_monthlygifts] ? true : false)
            @cont.Campaign_Updates__c = (params[:comm_campaign] ? true : false)
            @cont.MailingCountry = (params[:user_country] || "")
            @cont.save
            
            c = convio_api_session
            add_ids=""
            remove_ids=""
            
            if params[:all_preferences]
              params[:ecomm_campaign] = "1042"
              params[:ecomm_important] = "1041"
              params[:ecomm_newsletter] = "1021"
            end
            
            add_ids += params[:ecomm_newsletter] ? "1021," : ""
            add_ids += params[:ecomm_important] ? "1041," : ""
            add_ids += params[:ecomm_campaign] ? "1042," : ""
            remove_ids += params[:ecomm_newsletter] ? "" : "1021,"
            remove_ids += params[:ecomm_important] ? "" : "1041,"
            remove_ids += params[:ecomm_campaign] ? "" : "1042,"
            
            puts "RESULT: "
            begin
              puts c.update(@cont.cv__Convio_ID__c.to_i, nil, nil, nil, nil, nil, nil, nil, nil, {'remove_interest_ids' => remove_ids, 'add_interest_ids' => add_ids})
            rescue
            end
          end
          format.html { redirect_to "/mymoh/account", notice: 'User was successfully updated.' }
          format.json { head :ok }
        else
          format.html { render action: "edit" }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    if is_admin_user?
      @user = User.find(params[:id])
      @user.destroy

      respond_to do |format|
        format.html { redirect_to users_url }
        format.json { head :ok }
      end
    else
      respond_to do |format|
        format.html { redirect_to "/" }
      end
    end
  end
end
