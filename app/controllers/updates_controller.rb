class UpdatesController < ApplicationController
  # GET /updates
  # GET /updates.json
  def index
    #@updates = Update.all.reverse
    @title = "Haiti Updates | Updates on What's Happening at Mission of Hope, Haiti"
    @meta ="Get updates on what's happening in Haiti from Mission of Hope, Haiti (MOH)."
    @cid = params[:cid]
    @user = current_user
    @isadmin = is_admin_user?
    @itemCount = 0
    if @cid.nil?
      #@jason = Update.all.to_gmaps4rails
      @categories = Category.joins(:updates).order("categoryname asc").uniq
      @updates = Update.order("postdate desc").limit(40)
    else
      @updates = Update.joins(:categories).where("category_id=" + @cid).order("postdate desc").limit(40)
      #@jason = @updates.to_gmaps4rails
      @category = Category.find(@cid)
    end

    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# index.html.erb
      format.json { render json: @updates }
    end
  end

  # GET /updates/1
  # GET /updates/1.json
  def show
    @update = Update.find(params[:id])
    @photo = @update.assets.last
    @blogs = Post.last(3)
    unless @update.categories.count == 0
      @cat=@update.categories.order("categoryname asc").limit(1)
      @cat2=@update.categories.order("categoryname asc").offset(1)
      @cats = @update.categories
      
      @related_result = []
      @cats.each do |cat|
        @related_result += Update.joins(:categories).where("category_id=" + cat.id.to_s).reverse
        @related_result = @related_result.uniq{|x| x.title}
      end
      
      @blogs = []
      @cats.each do |cat|
        @blogs += Post.joins(:categories).where("category_id=" + cat.id.to_s)
        @blogs = @blogs.uniq{|x| x.title}
      end
      
      @related_projects = []
      @cats.each do |cat|
        @related_projects += Project.joins(:categories).where("category_id=" + cat.id.to_s).reverse
        @related_projects = @related_projects.uniq{|x| x.projectname}
      end
      
    end
    @isadmin = is_admin_user?

    respond_to do |format|
      format.html {render :layout=>"homeLayout"} # show.html.erb
      format.json { render json: @update }
    end
  end

  # GET /updates/new
  # GET /updates/new.json
  def new
    if is_admin_user?
      @update = Update.new
      @update.assets.build

      respond_to do |format|
        format.html {render :layout=>"homeLayout"} # new.html.erb
        format.json { render json: @update }
      end
    else
      respond_to do |format|
        format.html { redirect_to "/updates/" }
      end
    end
  end

  # GET /updates/1/edit
  def edit
    if is_admin_user?
      @update = Update.find(params[:id])
      @update.assets.build
      respond_to do |format|
         format.html {render :layout=>"homeLayout"}
      end
    else
      respond_to do |format|
        format.html { redirect_to "/updates/" }
      end
    end
  end

  # POST /updates
  # POST /updates.json
  def create
    puts "Title: " + params[:update]["title"]
    @update = Update.new(params[:update])
    
    unless params[:update]["title"].empty? or params[:update]["body"].empty?

      respond_to do |format|
        if @update.save
          format.html { redirect_to @update, notice: 'Update was successfully created.' }
          format.json { render json: @update, status: :created, location: @update }
          
        else
          format.html { render action: "new" }
          format.json { render json: @update.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PUT /updates/1
  # PUT /updates/1.json
  def update
    @update = Update.find(params[:id])

    respond_to do |format|
      if @update.update_attributes(params[:update])
        format.html { redirect_to @update, notice: 'Update was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @update.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /updates/1
  # DELETE /updates/1.json
  def destroy
    @update = Update.find(params[:id])
    @update.destroy

    respond_to do |format|
      format.html { redirect_to updates_url }
      format.json { head :ok }
    end
  end
end
