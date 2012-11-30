class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  def index
    @cid = params[:cid]
    @mid = params[:mid]
    @page = params[:page].to_i #for pagination
    @posts_per_page = 7
    @user = current_user
    @updates = Update.last(3).reverse
    @postsyear = @posts = Post.order("postdate desc").where("postdate > ?",Time.now.beginning_of_month.months_ago(11))
    if @cid.nil? && @mid.nil? #no date params
      
      #do some math for pagination links
      @count = Post.count
      @total_pages = @count / @posts_per_page
      if (@count % @posts_per_page) #add page for remainder that aren't a full block
        @total_pages += 1
      end
      if !@page.nil? #showing a different set than most recent group (pagination link)
        @offset = @page.to_i * @posts_per_page
        @posts = Post.order("postdate desc").offset(@offset).limit(@posts_per_page)
      else
        @posts = @postsyear.take(@posts_per_page)
      end
    elsif !@mid.nil?
      @month = DateTime.strptime(@mid,'%m-%Y')
      @posts = Post.order("postdate desc").where("postdate >= ? and postdate <= ?",@month.beginning_of_month,@month.end_of_month)
    else
      @posts = Post.joins(:categories).where("category_id=" + @cid).order('postdate desc')
      @category = Category.find(@cid)
    end
    @months = Array.new
    @postsyear.each do |post|
      @months << post.postdate.strftime("%B %Y")
    end
    @categories = Category.joins(:posts).order("categoryname asc").uniq    
    respond_to do |format|
       format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
      format.json { render json: @posts }
       format.rss { render :layout => false } #index.rss.builder
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @isadmin = is_admin_user?
    @updates = Update.last(3).reverse
    @post = Post.find(params[:id])
    @title = @post.metatitle
    @meta = @post.metadescription
    @assets = @post.assets.all
    @categories = Category.joins(:posts).order("categoryname asc").uniq
    @posts = Post.order("postdate desc").where("postdate > ?",Time.now.beginning_of_month.months_ago(11))
    @months = Array.new
    @posts.each do |post|
      @months << post.postdate.strftime("%B %Y")
    end
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    if is_admin_user?
      @post = Post.new
      @post.assets.build

      respond_to do |format|
        format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
        format.json { render json: @post }
      end
    else
      respond_to do |format|
        format.html { redirect_to "/blog" }
      end
    end
  end

  # GET /posts/1/edit
  def edit
    if is_admin_user?
      @post = Post.find(params[:id])
      @post.assets.build
       respond_to do |format|
        format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
      end
    else
      respond_to do |format|
        format.html { redirect_to "/blog" }
      end
    end
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])
    @post.thumb_id = params[:post][:thumb]

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :ok }
    end
  end
end
