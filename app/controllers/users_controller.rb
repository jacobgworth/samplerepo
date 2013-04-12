class UsersController < ApplicationController
  
  include Databasedotcom::Rails::Controller
  
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

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    if is_admin_user? || @user == current_user

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @user }
      end
     else
       respond_to do |format|
        format.html { redirect_to "/" }
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
      if (@contact == nil)
        @contact = Contact.new
      end
      respond_to do |format|
        puts "GOT HERE HER HE REHERHEHERHEHREHHERHEHHERHEHRHERE"
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
          format.html { redirect_to @user, notice: 'User was successfully updated.' }
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
