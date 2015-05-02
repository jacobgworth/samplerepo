class ProjectsController < ApplicationController
  # GET /projects
  # GET /projects.json
  
  def bluetoblock
    @project = Project.find(5)
    @title = @project.projectname + " | MOH Haiti"
    @meta = @project.projectname + " is a Mission of Hope, Haiti project currently underway in Haiti."
    @population = @project.communities.sum('population')#Community.joins(:projects).where("project_id=" + @category.id.to_s)
    @assets = @project.assets.all
    @user = current_user
    @category = @project.categories.first
    @updates = @project.updates.last(3).reverse #Update.last(3).reverse
    @posts = @project.posts.order(:postdate).reverse_order.last(3)
    @fundpercent = 0
    if !@project.fundsneeded.nil? && @project.fundsneeded > 0
      @fundpercent = (@project.fundsraised/@project.fundsneeded) * 100.00
    end
    @fundPercentImage = 'percent0.png'
    if @fundpercent >= 10 && @fundpercent < 20
      @fundPercentImage = 'percent10.png'
    elsif @fundpercent >= 20 && @fundpercent < 30
      @fundPercentImage = 'percent20.png'
    elsif @fundpercent >= 30 && @fundpercent < 40
      @fundPercentImage = 'percent30.png'
    elsif @fundpercent >= 40 && @fundpercent < 50
      @fundPercentImage = 'percent40.png'
    elsif @fundpercent >= 50 && @fundpercent < 60
      @fundPercentImage = 'percent50.png'
    elsif @fundpercent >= 60 && @fundpercent < 70
      @fundPercentImage = 'percent60.png'
    elsif @fundpercent >= 70 && @fundpercent < 80
      @fundPercentImage = 'percent70.png'
    elsif @fundpercent >= 80 && @fundpercent < 90
      @fundPercentImage = 'percent80.png'
    elsif @fundpercent >= 90 && @fundpercent < 97
      @fundPercentImage = 'percent90.png'
    elsif @fundpercent >= 97
      @fundPercentImage = 'percent100.png'
    end

    respond_to do |format|
      format.html {render :layout=>"b2b_layout"}# show.html.erb
      format.json { render json: @project }
    end    
  end
  
  def index
    @title = "Haiti Village Projects from Mission of Hope, Haiti (MOH)"
    @meta = "MOH Haiti projects allow us to serve the Haitian population by finding education, water, housing, construction, nutrition and orphan care solutions."
    @cid = params[:cid]
    @user = current_user
    @itemCount = 0
    @bgimage = "hero-projects.jpg"
    if @cid.nil?
      @title = "Projects | MOH Haiti"
      @meta = "See all Mission of Hope projects currently underway in Haiti"
      @jason = Project.all.to_gmaps4rails
      @categories = Category.joins(:projects).order("categoryname asc").uniq
      @projects = Project.all
    else
      @projects = Project.joins(:categories).where("category_id=" + @cid)
      @jason = @projects.to_gmaps4rails
      @category = Category.find(@cid)
      @title = @category.categoryname + " Projects | MOH Haiti"
      @meta = "See all " + @category.categoryname + " Mission of Hope projects currently underway in Haiti"
      if @cid == "19"
        #Church advancement
        @bgimage = "hero-project-church-advancement.jpg";
      elsif @cid == "18"
        #Health Care
        @bgimage = "hero-project-health-care.jpg";
      elsif @cid == "16"
        #Water
        @bgimage = "hero-project-water.jpg";
      elsif @cid == "7"
        #Education
        @bgimage = "hero-project-education.jpg";
      elsif @cid == "17"
        #Housing
        @bgimage = "hero-project-housing.jpg";
      else
        @bgimage = "hero-projects.jpg";
      end
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
    @title = @project.projectname + " | MOH Haiti"
    @meta = @project.projectname + " is a Mission of Hope, Haiti project currently underway in Haiti."
    @population = @project.communities.sum('population')#Community.joins(:projects).where("project_id=" + @category.id.to_s)
    @assets = @project.assets.all
    @user = current_user
    @category = @project.categories.first
    @updates = @project.updates.last(3).reverse #Update.last(3).reverse
    @posts = @project.posts.order(:postdate).reverse_order.last(3)
    if current_user
      @subscribed = Subscription.where(:sub_id => @project.id, :user_id => current_user.id, :datatype => 'project')
    end
    @fundpercent = 0
    if !@project.fundsneeded.nil? && @project.fundsneeded > 0
      @fundpercent = (@project.fundsraised/@project.fundsneeded) * 100.00
    end
    @fundPercentImage = 'percent0.png'
    if @fundpercent >= 10 && @fundpercent < 20
      @fundPercentImage = 'percent10.png'
    elsif @fundpercent >= 20 && @fundpercent < 30
      @fundPercentImage = 'percent20.png'
    elsif @fundpercent >= 30 && @fundpercent < 40
      @fundPercentImage = 'percent30.png'
    elsif @fundpercent >= 40 && @fundpercent < 50
      @fundPercentImage = 'percent40.png'
    elsif @fundpercent >= 50 && @fundpercent < 60
      @fundPercentImage = 'percent50.png'
    elsif @fundpercent >= 60 && @fundpercent < 70
      @fundPercentImage = 'percent60.png'
    elsif @fundpercent >= 70 && @fundpercent < 80
      @fundPercentImage = 'percent70.png'
    elsif @fundpercent >= 80 && @fundpercent < 90
      @fundPercentImage = 'percent80.png'
    elsif @fundpercent >= 90 && @fundpercent < 97
      @fundPercentImage = 'percent90.png'
    elsif @fundpercent >= 97
      @fundPercentImage = 'percent100.png'
    end

    respond_to do |format|
      format.html {render :layout=>"applicationWithAdGallery"}# show.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    if is_admin_user?
      @project = Project.new
      @project.assets.build

      respond_to do |format|
       format.html {render :layout=>"homeLayout"}# index.html.erb
        format.json { render json: @project }
      end
     else
       respond_to do |format|
        format.html { redirect_to "/projects" }
       end
     end
  end

  # GET /projects/1/edit
  def edit
    if is_admin_user?
      @project = Project.find(params[:id])
      @project.assets.build
      respond_to do |format|
      format.html {render :layout=>"homeLayout"}# index.html.erb
      end
    else
      respond_to do |format|
      format.html { redirect_to "/projects" }
      end
    end
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(params[:project])
    @project.percentcomplete = 0 if @project.percentcomplete == ''

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
    if params[:project][:percentcomplete].nil? || params[:project][:percentcomplete] == ''
       params[:project][:percentcomplete] = 0
    end
    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to @project, notice: 'Post was successfully updated.' }
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


  #get "projects/transition_home" => "projects#project15extra"
  def project15extra
    @project = Project.find(15)
    @title = @project.projectname + " | MOH Haiti"
    @meta = @project.projectname + " is a Mission of Hope, Haiti project currently underway in Haiti."
    @population = @project.communities.sum('population')#Community.joins(:projects).where("project_id=" + @category.id.to_s)
    @assets = @project.assets.all
    @user = current_user
    @category = @project.categories.first
    @updates = @project.updates.last(3).reverse #Update.last(3).reverse
    @posts = @project.posts.order(:postdate).reverse_order.last(3)
    if current_user
      @subscribed = Subscription.where(:sub_id => @project.id, :user_id => current_user.id, :datatype => 'project')
    end
    @fundpercent = 0
    if !@project.fundsneeded.nil? && @project.fundsneeded > 0
      @fundpercent = (@project.fundsraised/@project.fundsneeded) * 100.00
    end
    @fundPercentImage = 'percent0.png'
    if @fundpercent >= 10 && @fundpercent < 20
      @fundPercentImage = 'percent10.png'
    elsif @fundpercent >= 20 && @fundpercent < 30
      @fundPercentImage = 'percent20.png'
    elsif @fundpercent >= 30 && @fundpercent < 40
      @fundPercentImage = 'percent30.png'
    elsif @fundpercent >= 40 && @fundpercent < 50
      @fundPercentImage = 'percent40.png'
    elsif @fundpercent >= 50 && @fundpercent < 60
      @fundPercentImage = 'percent50.png'
    elsif @fundpercent >= 60 && @fundpercent < 70
      @fundPercentImage = 'percent60.png'
    elsif @fundpercent >= 70 && @fundpercent < 80
      @fundPercentImage = 'percent70.png'
    elsif @fundpercent >= 80 && @fundpercent < 90
      @fundPercentImage = 'percent80.png'
    elsif @fundpercent >= 90 && @fundpercent < 97
      @fundPercentImage = 'percent90.png'
    elsif @fundpercent >= 97
      @fundPercentImage = 'percent100.png'
    end

    respond_to do |format|
      format.html {render :layout=>"applicationWithAdGallery"}# show.html.erb
      format.json { render json: @project }
    end
  end


end

