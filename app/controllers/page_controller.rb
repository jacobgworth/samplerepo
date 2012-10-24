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
    @txtname = params[:txtname]
    @txtphone = params[:txtphonenumber]
    @txtemail = params[:txtemail]
    @txtaddress = params[:txtaddress]
    @txtcity = params[:txtcity]
    @txtstate = params[:txtstate]
    @txtzip = params[:txtzip]
    @txtchurchname = params[:txtchurchname]
    @txtchurchaddress = params[:txtchurchaddress]
    @txtchurchcity = params[:txtchurchcity]
    @txtchurchstate = params[:txtchurchstate]
    @txtchurchzip = params[:txtchurchzip]
    @txtchurchwebsite = params[:txtchurchwebsite]
    @txtpastorname = params[:txtpastorname]
    @txtpastorphone = params[:txtpastorphone]
    @txtmissionname = params[:txtmissionname]
    @txtmissionphone = params[:txtmissionphone]
    @txtcomments = params[:txtcomments]
    @prefs = " "
    if !params[:chkadvocate].nil?
      @prefs = @prefs + "Advocate,"
    end
    if !params[:chkambassador].nil?
      @prefs = @prefs + "Ambassador,"
    end
    if !params[:chkanchor].nil?
      @prefs = @prefs + "Anchor"
    end
    if !@txtname.nil? && @txtname != '' 
      @isvalid = true
      @data = {
        :txtname => @txtname,
        :txtphone => @txtphone,
        :txtemail => @txtemail,
        :txtaddress => @txtaddress,
        :txtcity => @txtcity,
        :txtstate => @txtstate,
        :txtzip => @txtzip,
        :txtchurchname => @txtchurchname,
        :txtchurchaddress => @txtchurchaddress,
        :txtchurchcity => @txtchurchcity,
        :txtchurchstate => @txtchurchstate,
        :txtchurchzip => @txtchurchzip,
        :txtpastorname => @txtpastorname,
        :txtpastorphone => @txtpastorphone,
        :txtmissionname => @txtmissionname,
        :txtmissionphone => @txtmissionphone,
        :txtchurchwebsite => @txtchurchwebsite,
        :txtprefs => @prefs,
        :txtcomments => @txtcomments
      }
      respond_to do |format|
        ContactUsMailer.church_partner(@data).deliver
        format.html {render :layout=>"homeLayout"}# three_cords.html.erb
      end
    else
      respond_to do |format|
        format.html {render :layout=>"homeLayout"}# three_cords.html.erb
      end
    end
  end
  
  def clinic
     @category = Category.find_by_categoryname("Health Care")
    @projects = Project.joins(:categories).where("category_id=" + @category.id.to_s).last(4).reverse
    @posts = Post.joins(:categories).where("category_id=" + @category.id.to_s).order(:postdate).last(3).reverse
    @updates = Update.joins(:categories).where("category_id=" + @category.id.to_s).last(3).reverse
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
     @category = Category.find_by_categoryname("Health Care")
    @projects = Project.joins(:categories).where("category_id=" + @category.id.to_s).last(4).reverse
    @posts = Post.joins(:categories).where("category_id=" + @category.id.to_s).order(:postdate).last(3).reverse
    @updates = Update.joins(:categories).where("category_id=" + @category.id.to_s).last(3).reverse
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
  
  def internships
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
    @user = current_user
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
   
  def mwen_kapab
    @category = Category.find_by_categoryname("Education")
    @projects = Project.joins(:categories).where("category_id=" + @category.id.to_s).last(4).reverse
    @posts = Post.joins(:categories).where("category_id=" + @category.id.to_s).order(:postdate).last(3).reverse
    @updates = Update.joins(:categories).where("category_id=" + @category.id.to_s).last(3).reverse
    @villages = Community.joins(:projects=>:categories).where("category_id=?",@category.id.to_s)
    
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end
  
  def newsletter_thank_you
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}
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
  
  def our_story
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end

  def partner_of_hope
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end
  
  def preparing_for_mission_trips
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end
  
  def press
    @press = News.all.reverse
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
     @category = Category.find_by_categoryname("Health Care")
    @projects = Project.joins(:categories).where("category_id=" + @category.id.to_s).last(4).reverse
    @posts = Post.joins(:categories).where("category_id=" + @category.id.to_s).order(:postdate).last(3).reverse
    @updates = Update.joins(:categories).where("category_id=" + @category.id.to_s).last(3).reverse
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end
   
  def request_info
    @fname = params[:fname]
    @comments = params[:letter]
    @fromaddress = params[:email]
    @phone = params[:phonenumber]
    if !@fname.nil? && @fname != "" && !@comments.nil? && @comments != "" && !@fromaddress.nil? && @fromaddress != ""
      @isvalid = true
      @data = {
        :fname => @fname, 
        :fromaddress => @fromaddress, 
        :comments => @comments,
        :phone => @phone
      }
      respond_to do |format|
        ContactUsMailer.take_a_trip(@data).deliver
        format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
      end 
    else
      @formerrors = "There was an error with your submission. All fields are required."
      respond_to do |format|
        format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
      end
    end
  end
  
  def school_of_hope
    @category = Category.find_by_categoryname("Education")
    @projects = Project.joins(:categories).where("category_id=" + @category.id.to_s).last(4).reverse
    @posts = Post.joins(:categories).where("category_id=" + @category.id.to_s).order(:postdate).last(3).reverse
    @updates = Update.joins(:categories).where("category_id=" + @category.id.to_s).last(3).reverse
    @villages = Community.joins(:projects=>:categories).where("category_id=?",@category.id.to_s)
    
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end
  
  def share_photos
    FlickRaw.api_key = "1df2b5c52c4acb9e2217b7a43842732f"
    FlickRaw.shared_secret = "93aace8a1dba42d1"
    #@photos = flickr.interestingness.getList( :per_page => 5 )
    @photos = flickr.people.getPublicPhotos(:user_id => '45792545@N03',:per_page => '20')
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end
  
  def sitemap
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}
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
    @txtfirst = params[:txtfirst]
    @txtlast = params[:txtlast]
    @txtphone = params[:txtphone]
    @txtemail = params[:txtemail]
    @txtchurch = params[:txtchurch]
    @txtcity = params[:txtcity]
    @txtstate = params[:txtstate]
    @txtzip = params[:txtzip]
    @txtmessage = params[:txtmessage]
    @txtdatesinterested = params[:txtdatesinterested]

    if !@txtfirst.nil? && @txtfirst != "" && !@txtphone.nil? && @txtphone != "" && !@txtemail.nil? && @txtemail != "" && !@txtmessage.nil? && @txtmessage != ""
      @isvalid = true
      @data = {
        :txtfirst => @txtfirst,
        :txtlast => @txtlast,
        :txtphone => @txtphone,
        :txtemail => @txtemail,
        :txtchurch => @txtchurch,
        :txtcity => @txtcity,
        :txtstate => @txtstate,
        :txtzip => @txtzip,
        :txtmessage => @txtmessage,
        :txtdatesinterested => @txtdatesinterested
      }
      respond_to do |format|
        ContactUsMailer.vision_trip(@data).deliver
        format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
      end 
     else
       respond_to do |format|
         format.html {render :layout=>"homeLayout"}# three_cords.html.erb
       end
     end
  end
  
  def volunteer
    @txtname = params[:txtname]
    @txtmessage = params[:txtmessage]
    @txtemail = params[:txtemail]
    @txtphonenumber = params[:txtphonenumber]
    if !@txtname.nil? && @txtname != "" && !@txtmessage.nil? && @txtmessage != "" && !@txtemail.nil? && @txtemail != ""
      @isvalid = true
      @data = {
        :txtname => @txtname, 
        :txtemail => @txtemail, 
        :txtmessage => @txtmessage,
        :txtphonenumber => @txtphonenumber
      }
      respond_to do |format|
        ContactUsMailer.volunteer(@data).deliver
        format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
      end
    else
      @errors = "There was an error with your submission. All fields are required."
      respond_to do |format|
        format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
      end
    end
  end
  
  def what_we_do
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end
  
  
  def write_my_child
    @name = params[:name]
    @letterbody = params[:letter]
    @fromaddress = params[:email]
    @phone = params[:phonenumber]
    @childname = params[:childname]
    @childnumber = params[:childnumber]
    if !@name.nil? && @name != "" && !@letterbody.nil? && @letterbody != "" && !@childnumber.nil? && @childnumber != ""
      @isvalid = true
      @data = {
        :fname => @name, 
        :fromaddress => @fromaddress, 
        :bodym => @letterbody,
        :phone => @phone,
        :childname => @childname,
        :childnumber => @childnumber
      }
      respond_to do |format|
        ContactUsMailer.write_child(@data).deliver
        format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
      end 
    else
      @formerrors = "There was an error with your submission. All fields are required."
      respond_to do |format|
        format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
      end  
    end
    
  end
    
  

  
  
  
end
