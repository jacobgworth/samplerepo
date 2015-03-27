class InternsController < ApplicationController
  layout "homeLayout"
  
  
  # GET /interns
  # GET /interns.json
  def index
    @interns = Intern.order("created_at desc")
    @isadmin = is_admin_user?
    unless @isadmin
      redirect_to "/" and return
    end

    respond_to do |format|
      format.html # index.html.erb
      format.csv #{ send_data @interns.as_csv }
      format.json { render json: @interns }
    end
  end

  # GET /interns/1
  # GET /interns/1.json
  def show
    @isadmin = is_admin_user?
    unless @isadmin
      redirect_to "/" and return
    end
    @intern = Intern.find(params[:id])
    @photo = @intern.assets.order('created_at desc').last
    #Build @traits string with true traits
    @traits = ""
    if @intern.modest_trait
      @traits="Modest,"
    end
    if @intern.mature_trait
      @traits+=" Mature,"
    end
    if @intern.kind_trait
      @traits+=" Kind,"
    end
    if @intern.abrasive_trait
      @traits+=" Abrasive,"
    end
    if @intern.organized_trait
      @traits+=" Organized,"
    end
    if @intern.quiet_trait
      @traits+=" Quiet,"
    end
    if @intern.moody_trait
      @traits+=" Moody,"
    end
    if @intern.teachable_trait
      @traits+=" Teachable,"
    end
    if @intern.self_motivated_trait
      @traits+=" Self-motivated,"
    end
    if @intern.genuine_trait
      @traits+=" Genuine,"
    end
    if @intern.detail_oriented_trait
      @traits+=" Detail-oriented,"
    end
    if @intern.loving_trait
      @traits+=" Loving,"
    end
    if @intern.sarcastic_trait
      @traits+=" Sarcastic,"
    end
    if @intern.selfish_trait
      @traits+=" Selfish,"
    end
    if @intern.trustworthy_trait
      @traits+=" Trustworthy,"
    end
    if @intern.tactful_trait
      @traits+=" Tactful,"
    end
    if @intern.compassionate_trait
      @traits+=" Compassionate,"
    end
    if @intern.hard_working_trait
      @traits+=" Hard-Working,"
    end
    if @intern.adaptive_trait
      @traits+=" Adaptive,"
    end
    if @intern.lazy_trait
      @traits+=" Lazy,"
    end
    if @intern.punctual_trait
      @traits+=" Punctual,"
    end
    if @intern.sensitive_trait
      @traits+=" Sensitive,"
    end
    if @intern.socially_awkward_trait
      @traits+=" Socially awkward,"
    end
    if @intern.considerate_trait
      @traits+=" Considerate,"
    end
    if @intern.motivated_trait
      @traits+=" Motivated,"
    end
    if @intern.impulsive_trait
      @traits+=" Impulsive,"
    end
    if @intern.relaxed_trait
      @traits+=" Relaxed,"
    end
    if @intern.friendly_trait
      @traits+=" Friendly,"
    end
    if @intern.determined_trait
      @traits+=" Determined,"
    end
    if @intern.leader_trait
      @traits+=" Leader,"
    end
    @traits = @traits.chop
    @traits == "" ? "No seld-selected traits" : @traits

    respond_to do |format|
      format.html # show.html.erb
      format.csv #show.csv.erb
      format.json { render json: @intern }
    end
  end

  # GET /interns/new
  # GET /interns/new.json
  def new
    @intern = Intern.new
    @intern.assets.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @intern }
    end
  end

  # GET /interns/1/edit
  def edit
    @isadmin = is_admin_user?
    unless @isadmin
      redirect_to "/" and return
    end
    @intern = Intern.find(params[:id])
  end

  # POST /interns
  # POST /interns.json
  def create
    @intern = Intern.new(params[:intern])
    @intern.is_archived=nil;

    respond_to do |format|
      if @intern.save
        UserMailer.new_intern_app_notify(@intern.id).deliver
        format.html { redirect_to "/intern_thank_you", notice: 'Intern was successfully created.' }
        #format.json { render json: @intern, status: :created, location: @intern }
      else
        format.html { render action: "new" }
        format.json { render json: @intern.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /interns/1
  # PUT /interns/1.json
  def update
    @intern = Intern.find(params[:id])

    respond_to do |format|
      if @intern.update_attributes(params[:intern])
        format.html { redirect_to @intern, notice: 'Intern was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @intern.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interns/1
  # DELETE /interns/1.json
  def destroy
    @intern = Intern.find(params[:id])
    @intern.destroy

    respond_to do |format|
      format.html { redirect_to interns_url }
      format.json { head :no_content }
    end
  end
  
  def archive
    @intern = Intern.find(params[:id])
#    @intern.is_archived=true
    @intern.toggle(:is_archived)
    @intern.save
    redirect_to "/interns" end#:action => "index"  end

end
