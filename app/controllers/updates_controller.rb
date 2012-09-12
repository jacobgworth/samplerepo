class UpdatesController < ApplicationController
  # GET /updates
  # GET /updates.json
  def index
    #@updates = Update.all.reverse
    
    @cid = params[:cid]
    @user = current_user
    @isadmin = is_admin_user?
    @itemCount = 0
    if @cid.nil?
      #@jason = Update.all.to_gmaps4rails
      @categories = Category.joins(:updates).order("categoryname asc").uniq
      @updates = Update.all.reverse
    else
      @updates = Update.joins(:categories).where("category_id=" + @cid).reverse
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
    @isadmin = is_admin_user?

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @update }
    end
  end

  # GET /updates/new
  # GET /updates/new.json
  def new
    if is_admin_user?
      @update = Update.new

      respond_to do |format|
        format.html # new.html.erb
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
    else
      respond_to do |format|
        format.html { redirect_to "/updates/" }
      end
    end
  end

  # POST /updates
  # POST /updates.json
  def create
    @update = Update.new(params[:update])

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
