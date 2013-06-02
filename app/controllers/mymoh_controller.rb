class MymohController < ApplicationController
  include Databasedotcom::Rails::Controller
  before_filter :require_login, :except => [:login]
  
  def require_login
    if current_user == nil
      redirect_to "/mymoh/login"
    end
  end
  
  def index
      convio_id = current_user.convio_id || ""
      puts "CONVIO ID: " + convio_id.to_s
      @account = Contact.find_by_Id("#{convio_id}")
      unless @account == nil
        redirect_to "/mymoh/following"
        #respond_to do | format |
          #format.html { render :layout=>"homeLayout"}
        #end
      else
        redirect_to "/users/" + current_user.id.to_s + "/edit"
      end
  end
  
  def account
    @account = Contact.find_by_Id(current_user.convio_id)
    @spouse_id = (Account.find_by_cv__Head_of_Household__c(@account.Id).cv__Secondary_Contact__c || Account.find_by_cv__Secondary_Contact__c(@account.Id).cv__Head_of_Household__c) 
    @spouse = Contact.find_by_Id(@spouse_id)
    
    c = convio_api_session
    conv_id = @account.cv__Convio_ID__c.to_i
    @interests = current_user.get_interests
    puts "INTERESTS: " + @interests.to_s
    respond_to do |format|
      format.html {render :layout=>"homeLayout"} 
    end
  end
  
  def login
    respond_to do |format|
      format.html {render :layout=>"homeLayout"} 
    end
  end
  
  def edit
    #for editing mymoh account details--syncs to convio
    @contact = Contact.find_by_Id(current_user.convio_id)
    @user = current_user
    if request.method == "POST"
      #handle new variables, save changes
      if @user.update_attributes(params[:user])
        format.html {redirect_to "/mymoh", notice: "Account changes saved."}
      else
        format.html { redirect_to "/mymoh/account/edit" }
      end
    else
      #display form to edit account details
      respond_to do |format|
        format.html { render :layout=>"homeLayout" }
      end
    end
  end
  
  def following
    @village_subs = Subscription.where(:datatype => 'village', :user_id => current_user.id).map(&:sub_id)
    @project_subs = Subscription.where(:datatype => 'project', :user_id => current_user.id).map(&:sub_id)
    #@posts = Post.joins(:communities).where("community_id=3").limit(3)
    #@villages = Community.where(:id => @village_subs)
    #if @villages.empty?
      #puts "Villages were empty!"
      #@villages = Community.where(:id => 3)
    #end
    @villages = []
    @projects = Project.where(:id => @project_subs)
    
    @posts = Post.joins(:communities).where(:communities => {:id => @village_subs}).limit(125).reverse
    @updates = Update.joins(:communities).where(:communities => {:id => @village_subs}).limit(125).reverse
    respond_to do |format|
      format.html { render :layout=>"homeLayout" }
    end
  end
  
  def giving
    @account = Contact.find_by_Id(current_user.convio_id)
    #@account = Contact.find_by_Name("Lindsey Rubino")
    dbdc_client.materialize("cv__Recurring_Gift__c")
    dbdc_client.materialize("cv__Donation_Designation_Relationship__c")
    dbdc_client.materialize("cv__Designation__c")
    @recurring = Cv__Recurring_Gift__c.find_all_by_cv__Contact__c(@account.Id)
    #@donations = Opportunity.find_all_by_cv__Contact__c(@account.Id)
    query = "cv__Contact__c = '" + current_user.convio_id + "' AND CloseDate > " + Date.today.year.to_s + "-" + Date.today.strftime("%m") + "-01"
    @donations = Opportunity.query(query)
    respond_to do | format |
      format.html { render :layout => "homeLayout" }
    end
  end
  
  def givingedit
    @account = Contact.find_by_Id(current_user.convio_id)
    dbdc_client.materialize("cv__Recurring_Gift__c")
    @recurring = Cv__Recurring_Gift__c.find_all_by_cv__Contact__c(@account.Id)
    respond_to do | format |
      format.html { render :layout => "homeLayout" }
    end
  end
  
  def givingedit_post
    @account = Contact.find_by_Id(current_user.convio_id)
    dbdc_client.materialize("cv__Recurring_Gift__c")
    @recurring = Cv__Recurring_Gift__c.find_by_Id(params[:gift_id])
    puts params[:gift_amount]
    @recurring.cv__Recurring_Amount__c = params[:gift_amount]
    @recurring.cv__RecurrenceDayOfMonth__c = params[:gift_day_of_month]
    @recurring.cv__Recurring_Gift_Status__c = params[:gift_status]
    @recurring.save
    #need to handle amount AND next_payment_amount
    redirect_to("/mymoh/giving/edit")
  end
  
  def givinghistory
    @start_date = params[:start_date] || Date.today.ago(1.month).strftime("%Y-%m-%d")
    @end_date = params[:end_date] || Date.today.strftime("%Y-%m-%d")
    dbdc_client.materialize("cv__Donation_Designation_Relationship__c")
    dbdc_client.materialize("cv__Designation__c")
    #@donations = Opportunity.find_all_by_cv__Contact__c(current_user.convio_id)
    query = "cv__Contact__c = '" + current_user.convio_id + "' AND CloseDate > " + @start_date + " AND CloseDate < " + @end_date 
    puts query
    @donations = Opportunity.query(query)
    puts "LENGTH of History: " + @donations.length.to_s
    @donations = @donations.sort_by(&:CloseDate).reverse
    respond_to do | format |
      format.html { render :layout => "homeLayout" }
    end
  end
  
  def givingreceipt
    dbdc_client.materialize("cv__Donation_Designation_Relationship__c")
    dbdc_client.materialize("cv__Designation__c")
    aquery = "cv__Contact__c = '" + current_user.convio_id + "' AND Id = '" + params[:gift_id] + "'"
    puts aquery
    @donation = Opportunity.query(aquery)
    puts @donation
    respond_to do |format|
      format.html { render :layout => "receiptLayout" }
    end
  end
  
  def sponsorships
    @account = Contact.find_by_Id(current_user.convio_id)
    #@account = Contact.find_by_Name("Lindsey Rubino")
    @sponsorships = Child_Sponsorship__c.query("Sponsor__c = '" + @account.Id + "'")
    unless @sponsorships == nil
      #if we find sponsorships
      @children = []
      @sponsorships.each do | spons |
        #find the child associated with each sponsorship
        @child = Child__c.find_by_Id(spons.Child__c)
        #find child's photo
        @photo = Picture__c.find_by_Child__c(@child.Id).Photo__c
        #set an unused variable to carry the photo url
        @child.LastModifiedById = @photo
        #add child to array of children
        @children << @child
      end
    end
    
    #get blogs & updates from "school of hope" and "village of hope"
    #right now using categories 4=church of hope, and 7=education
    @related_result = []
    @cats = [7, 13]
    @cat = []
    @cat << Category.find(4)
    @cats.each do |cat|
      @related_result += Update.joins(:categories).where("category_id=" + cat.to_s).reverse
      @related_result = @related_result.uniq{|x| x.title}
    end
    
    @blogs = []
    @cats.each do |cat|
      @blogs += Post.joins(:categories).where("category_id=" + cat.to_s).reverse
      @blogs = @blogs.uniq{|x| x.title}
    end
    
    @related_projects = []
    @cats.each do |cat|
      @related_projects += Project.joins(:categories).where("category_id=" + cat.to_s).reverse
      @related_projects = @related_projects.uniq{|x| x.projectname}
    end
    
    #pull in other children for "sponsor these too" 
    @otherchildren = Child__c.query("Number_of_Photos__c > 0 AND Online_Status__c = 'Available' LIMIT 3")
    
    respond_to do |format|
      format.html {render :layout=>"homeLayout"} 
    end
  end 
  
  def mytrips
    #Display mission trips a person is involved with.
    #Contact is linked via Trip_Participation__c to a Trip__c, potentially many relationships
    
    @contact = Contact.find_by_Id(current_user.convio_id)
    @trip_participations = Trip_Participation__c.query("Contact__c = '" + @contact.Id + "' ORDER BY CreatedDate DESC")
    
    #cannot traverse relationships with ActiveRecord here, so need to loop through participations
    #to find each trip & add to @trips array
    #@trips = []
    @trips = @trip_participations
    unless @trip_participations == nil
      @trip_participations.each do | tripp |
        #@trips << Trip__c.find_by_Id(tripp.Trip__c)
      end
    end
    respond_to do |format|
      format.html { render :layout => "homeLayout" }
    end
  end
  
  def tripshow
    #@trip = Trip__c.find_by_Id(params[:tripid])
    @trip = Trip_Participation__c.find_by_Id(params[:tripid])
    
    #Find sponsorships--only finding the first one here
    @sponsorship = Child_Sponsorship__c.find_by_Sponsor__c(current_user.convio_id)
    unless @sponsorship.nil?
      @child = Child__c.find_by_Id(@sponsorship.Child__c)
    end
    respond_to do |format|
      format.html { render :layout => "homeLayout" }
    end
  end
  
end
