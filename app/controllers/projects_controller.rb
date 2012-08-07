class ProjectsController < ApplicationController
  # GET /projects
  # GET /projects.json
  
  def index
    @cid = params[:cid]
    @user = current_user
    @itemCount = 0
    if @cid.nil?
      @jason = Project.all.to_gmaps4rails
      @categories = Category.joins(:projects).order("categoryname asc").uniq
      @projects = Project.all
    else
      @projects = Project.joins(:categories).where("category_id=" + @cid)
      @jason = @projects.to_gmaps4rails
      @category = Category.find(@cid)
    end

    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# index.html.erb
      format.json { render json: @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])
    @assets = @project.assets.all
    @user = current_user
    @category = @project.categories.first
    @updates = @project.updates.all

    respond_to do |format|
      format.html {render :layout=>"applicationWithAdGallery"}# show.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @project = Project.new
    @project.assets.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
    @project.assets.build
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(params[:project])

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @project = Project.find(params[:id])
    params[:project][:fundsneeded] = params[:project][:fundsneeded].gsub(/[^\d\.]/, '')
    params[:project][:fundsraised] = params[:project][:fundsraised].gsub(/[^\d\.]/, '')


    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :ok }
    end
  end
end
