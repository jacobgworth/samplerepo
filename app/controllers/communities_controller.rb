class CommunitiesController < ApplicationController
  # GET /communities
  # GET /communities.json
  def index
    @communities = Community.all
    @jason = Community.all.to_gmaps4rails
    @user = current_user
    @itemCount = 0
    
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# index.html.erb
      #format.json { render json: @communities }
    end
  end

  # GET /communities/1
  # GET /communities/1.json
  def show
    @user = current_user
    @community = Community.find(params[:id])
    @assets = @community.assets.all

    respond_to do |format|
      format.html {render :layout=>"homeLayout"} # show.html.erb
      format.json { render json: @community }
    end
  end

  # GET /communities/new
  # GET /communities/new.json
  def new
    if is_admin_user?
      @community = Community.new
      @community.assets.build

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @community }
      end
     else
      respond_to do |format|
        format.html { redirect_to "/communities/" }
      end
     end
  end

  # GET /communities/1/edit
  def edit
    if is_admin_user?
      @community = Community.find(params[:id])
      @community.assets.build
    else
      respond_to do |format|
        format.html { redirect_to "/communities/" }
      end
    end
  end

  # POST /communities
  # POST /communities.json
  def create
    @community = Community.new(params[:community])

    respond_to do |format|
      if @community.save
        format.html { redirect_to @community, notice: 'Community was successfully created.' }
        format.json { render json: @community, status: :created, location: @community }
      else
        format.html { render action: "new" }
        format.json { render json: @community.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /communities/1
  # PUT /communities/1.json
  def update
    @community = Community.find(params[:id])

    respond_to do |format|
      if @community.update_attributes(params[:community])
        format.html { redirect_to @community, notice: 'Community was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @community.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /communities/1
  # DELETE /communities/1.json
  def destroy
    @community = Community.find(params[:id])
    @community.destroy

    respond_to do |format|
      format.html { redirect_to communities_url }
      format.json { head :ok }
    end
  end
end
