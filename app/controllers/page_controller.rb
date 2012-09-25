class PageController < ApplicationController
  
  def about_haiti
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end
  
  def about_us
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end
  
  def be_a_partner
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end
  
  def console
    unless is_admin_user?
      respond_to do |format|
        format.html { redirect_to "/" }
      end
    else
      respond_to do |format|
        format.html {render :layout=>"homeLayout"}# console.html.erb
      end
    end
  end
  
  def church_partner
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# three_cords.html.erb
    end
  end
  
  def clinic
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end
  
  def communities_impacted
    @category = Category.find_by_categoryname("Church Advancement")
    @villages = Community.joins(:projects => :categories).where("category_id=" + @category.id.to_s)
    @projects = Project.joins(:categories).where("category_id=" + @category.id.to_s).last(4).reverse
    @posts = Post.joins(:categories).where("category_id=" + @category.id.to_s).order(:postdate).last(3).reverse
    @updates = Update.joins(:categories).where("category_id=" + @category.id.to_s).last(3).reverse
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# communities_impacted.html.erb
    end
  end
  
  def community_health
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end
  
  
  
  def contact_us
    @name = params[:name]
    @body = params[:letter]
    @subject = params[:topics]
    @fromaddress = params[:email]
    @phone = params[:phonenumber]
    if !@name.nil? && !@body.nil? && !@subject.nil? && !@fromaddress.nil? && !@phone.nil?
      @isvalid = true
      @data = {
        :name => @name, 
        :fromaddress => @fromaddress, 
        :subject => @subject, 
        :bodym => @body,
        :phone => @phone
      }
    end
    if @isvalid
      ContactUsMailer.contact_us_mail(@data,@body).deliver
      respond_to do |format|
        format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
      end
    else
      respond_to do |format|
        format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
      end
    end
  end
  
  def downloads
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end
    
  def education
    @category = Category.find_by_categoryname("Education")
    @projects = Project.joins(:categories).where("category_id=" + @category.id.to_s).last(4).reverse
    @posts = Post.joins(:categories).where("category_id=" + @category.id.to_s).order(:postdate).last(3).reverse
    @updates = Update.joins(:categories).where("category_id=" + @category.id.to_s).last(3).reverse
    @villages = Community.joins(:projects=>:categories).where("category_id=?",@category.id.to_s)
    
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# orphan_care.html.erb
    end
  end
  
  def event
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end
  
  def faq
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end 
  
  def financial_info
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end
  
  def gift_store
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end
  
  def haiti_one
    @category = Category.find_by_categoryname("Haiti One")
    @projects = Project.joins(:categories).where("category_id=" + @category.id.to_s).last(4).reverse
    @posts = Post.joins(:categories).where("category_id=" + @category.id.to_s).order(:postdate).last(3).reverse
    @updates = Update.joins(:categories).where("category_id=" + @category.id.to_s).last(3).reverse
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end
  
  def health_care
    @category = Category.find_by_categoryname("Health Care")
    @projects = Project.joins(:categories).where("category_id=" + @category.id.to_s).last(4).reverse
    @posts = Post.joins(:categories).where("category_id=" + @category.id.to_s).order(:postdate).last(3).reverse
    @updates = Update.joins(:categories).where("category_id=" + @category.id.to_s).last(3).reverse
    
    @jason = @projects.to_gmaps4rails
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# health_care.html.erb
    end
  end
  
  def intern
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end
  
  def join_our_team
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end
  
  def learn_sponsor
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end
  
  def make_donation
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end
  
  def medical_mission_trips
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end
  
  def meet_our_staff
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end
  
  def mission_trips
    @experiences = Experience.last(5)
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}
    end
  end 
  
  def mission_trip_experinces
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end
   
  def mwem_kapab
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end
  
  def nutrition
    @category = Category.find_by_categoryname("Nutrition")
    @projects = Project.joins(:categories).where("category_id=" + @category.id.to_s).last(4).reverse
    @posts = Post.joins(:categories).where("category_id=" + @category.id.to_s).order(:postdate).last(3).reverse
    @updates = Update.joins(:categories).where("category_id=" + @category.id.to_s).last(3).reverse
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# nutrition.html.erb
    end
  end
  
  def orphan_care
    @category = Category.find_by_categoryname("Orphanage")
    @projects = Project.joins(:categories).where("category_id=" + @category.id.to_s).last(4).reverse
    @posts = Post.joins(:categories).where("category_id=" + @category.id.to_s).order(:postdate).last(3).reverse
    @updates = Update.joins(:categories).where("category_id=" + @category.id.to_s).last(3).reverse
    
    @jason = @projects.to_gmaps4rails
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# orphan_care.html.erb
    end
  end
   
  def preparing_for_trip
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end
  
  def press
     @category = Category.find_by_categoryname("Haiti One")
    @projects = Project.joins(:categories).where("category_id=" + @category.id.to_s).last(4).reverse
    @posts = Post.joins(:categories).where("category_id=" + @category.id.to_s).order(:postdate).last(3).reverse
    @updates = Update.joins(:categories).where("category_id=" + @category.id.to_s).last(3).reverse
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end
  
  def privacy
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end
   
  
  def prosthetics
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end
   
  def school_of_hope
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end
  
  def share_photos
    FlickRaw.api_key = "1df2b5c52c4acb9e2217b7a43842732f"
    FlickRaw.shared_secret = "93aace8a1dba42d1"
    #@photos = flickr.interestingness.getList( :per_page => 5 )
    @photos = flickr.people.getPublicPhotos(:user_id => '55332170@N08',:per_page => '20')
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end
  
  def sponsor_child
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end
  
  def sponsor_faq
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end
  
  def take_a_trip
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end
  
  def three_cords
    @category = Category.find_by_categoryname("3 Cords")
    @projects = Project.joins(:categories).where("category_id=" + @category.id.to_s).last(4).reverse
    @posts = Post.joins(:categories).where("category_id=" + @category.id.to_s).order(:postdate).last(3).reverse
    @updates = Update.joins(:categories).where("category_id=" + @category.id.to_s).last(3).reverse
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# three_cords.html.erb
    end
  end
  
  def trip_costs
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end
      
    
  def trip_dates
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end

   
  def trip_faqs
     respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end
  
  def videos
    respond_to do |format|
      format.html {render :layout=>"homeLayout"} #videos.html.erb
    end
  end
  
  def vision_mission_resolution
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end
  
  def vision_trip
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# three_cords.html.erb
    end
  end
  
  def volunteer
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end
  
  def what_we_do
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end
  
  
  def write_to_child
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end
    
  

  
  
  
end
