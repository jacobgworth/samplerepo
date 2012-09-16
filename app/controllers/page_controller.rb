class PageController < ApplicationController
  def what_we_do
  end
  
  def what_we_do
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end
    
  def medical_mission_trips
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end
      
    
  def mission_trip_experinces
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end
  
  def mission_trip_experiences
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end
      
    
  def preparing_for_trip
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end
      
    
  def take_a_trip
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
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
  
  def three_cords
    @category = Category.find_by_categoryname("3 Cords")
    @projects = Project.joins(:categories).where("category_id=" + @category.id.to_s).last(4).reverse
    @posts = Post.joins(:categories).where("category_id=" + @category.id.to_s).order(:postdate).last(3).reverse
    @updates = Update.joins(:categories).where("category_id=" + @category.id.to_s).last(3).reverse
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# three_cords.html.erb
    end
  end
  
  def vision_trip
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# three_cords.html.erb
    end
  end
  
  def church_partner
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# three_cords.html.erb
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
  
def nutrition
  @category = Category.find_by_categoryname("Nutrition")
  @projects = Project.joins(:categories).where("category_id=" + @category.id.to_s).last(4).reverse
  @posts = Post.joins(:categories).where("category_id=" + @category.id.to_s).order(:postdate).last(3).reverse
  @updates = Update.joins(:categories).where("category_id=" + @category.id.to_s).last(3).reverse
  respond_to do |format|
    format.html {render :layout=>"homeLayout"}# nutrition.html.erb
  end
end
  
  
  def mission_trips
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}
    end
  end  
  
    def downloads
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end
  
    def make_donation
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end
      
  
    def be_a_partner
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end
      
  
    def volunteer
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end
      
  
    def share_photos
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end
      
  
    def event
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end
  
    def sponsor_child
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end
  
    def learn_sponsor
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end
  
    def sponsor_faq
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end
  
    def gift_store
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end
      
  def write_to_child
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end
  
  def videos
    respond_to do |format|
      format.html {render :layout=>"homeLayout"} #videos.html.erb
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
end
