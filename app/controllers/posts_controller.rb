class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  def index
    @cid = params[:cid]
    @user = current_user
    if @cid.nil?
      @posts = Post.order('postdate desc')
    else
      @posts = Post.joins(:categories).where("category_id=" + @cid).order('postdate desc')
    end
    @categories = Category.order("categoryname asc")
    respond_to do |format|
       format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @isadmin = is_admin_user?
    @post = Post.find(params[:id])
    @assets = @post.assets.all
    @categories = Category.order("categoryname asc")

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
        format.html { redirect_to "/posts" }
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
        format.html { redirect_to "/posts" }
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
