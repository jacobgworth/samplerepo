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
    if is_admin_user?
      @user = User.find(params[:id])

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
    if is_admin_user?
      @user = User.new
      @contact = Contact.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @user }
      end
    else
      respond_to do |format|
        format.html { redirect_to "/" }
      end
    end
  end

  # GET /users/1/edit
  def edit
    if is_admin_user?
      @user = User.find(params[:id])
      @contact = Contact.find(@user.convio_id)
      if (@contact == nil)
        @contact = Contact.new
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
        @sfcontact = Contact.find_by_Email(@user.email)
        if (@sfcontact == nil)
            @sfcontact = Contact.create(
              :LastName => @user.last,
              :FirstName => @user.first,
              :Email => @user.email,
              :MailingStreet => @user.street1,
              :MailingCity => @user.city,
              :MailingState => @user.state,
              :MailingPostalCode => @user.zip
            )
        end
        @user.convio_id = @sfcontact.Id
        @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
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

    respond_to do |format|
      if @user.update_attributes(params[:user])
        @sfcontact = Contact.find(@user.convio_id)
        @sfcontact.LastName = @user.last
        @sfcontact.FirstName = @user.first
        @sfcontact.Email = @user.email
        @sfcontact.MailingStreet = @user.street1
        @sfcontact.MailingCity = @user.city
        @sfcontact.MailingState = @user.state
        @sfcontact.MailingPostalCode = @user.zip
        @sfcontact.save
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
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
