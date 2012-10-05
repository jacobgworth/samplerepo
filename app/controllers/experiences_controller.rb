class ExperiencesController < ApplicationController

layout "applicationWithMasonry"


  # GET /experiences
  # GET /experiences.json
  def index
    @experiences = Experience.all
    @user = current_user

    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
      format.json { render json: @experiences }
    end
  end

  # GET /experiences/1
  # GET /experiences/1.json
  def show
    @experience = Experience.find(params[:id])
    @projects = @experience.projects.all
    #@assets = @experience.assets.all

    respond_to do |format|
       format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
      format.json { render json: @experience }
    end
  end

  # GET /experiences/new
  # GET /experiences/new.json
  def new
    @experience = Experience.new
    @user = current_user 
    #5.times {@experience.assets.build}

    respond_to do |format|
    format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
      format.json { render json: @experience }
    end
  end

  # GET /experiences/1/edit
  def edit
    if is_admin_user?
      @experience = Experience.find(params[:id])
      @user = current_user
      #@experience.assets.build
      respond_to do |format|
        format.html {render :layout=>"homeLayout"}
      end
    else
      respond_to do |format|
        format.html { redirect_to "/experiences" }
      end
    end
  end

  # POST /experiences
  # POST /experiences.json
  def create
    @experience = Experience.new(params[:experience])

    respond_to do |format|
      if @experience.save
        format.html { redirect_to '/experiences', notice: 'Experience was successfully created.' }
        format.json { render json: @experience, status: :created, location: @experience }
      else
        format.html { render action: "new" }
        format.json { render json: @experience.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /experiences/1
  # PUT /experiences/1.json
  def update
    @experience = Experience.find(params[:id])

    respond_to do |format|
      if @experience.update_attributes(params[:experience])
        format.html { redirect_to @experience, notice: 'Experience was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @experience.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /experiences/1
  # DELETE /experiences/1.json
  def destroy
    @experience = Experience.find(params[:id])
    @experience.destroy

    respond_to do |format|
      format.html { redirect_to experiences_url }
      format.json { head :ok }
    end
  end
end
