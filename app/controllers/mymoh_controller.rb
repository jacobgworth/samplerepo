class MymohController < ApplicationController
  include Databasedotcom::Rails::Controller
  before_filter :require_login
  
  def require_login
    if current_user == nil
      redirect_to "/log_in"
    end
  end
  
  def index
      convio_id = current_user.convio_id || ""
      @account = Contact.find_by_Id(convio_id)
      unless @account == nil
        respond_to do | format |
          format.html { render :layout=>"homeLayout"}
        end
      else
        redirect_to "/users/" + current_user.id.to_s + "/edit"
      end
  end
  
  def account
    @account = Contact.find_by_Id(current_user.convio_id)
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
  
  def giving
    @account = Contact.find_by_Id(current_user.convio_id)
    #@account = Contact.find_by_Name("Lindsey Rubino")
    dbdc_client.materialize("cv__Recurring_Gift__c")
    @recurring = Cv__Recurring_Gift__c.find_by_cv__Contact__c(@account.Id)
    respond_to do | format |
      format.html { render :layout => "homeLayout" }
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
    @cats = [4, 7]
    @cat = []
    @cat << Category.find(4)
    @cats.each do |cat|
      @related_result += Update.joins(:categories).where("category_id=" + cat.to_s).reverse
      @related_result = @related_result.uniq{|x| x.title}
    end
    
    @blogs = []
    @cats.each do |cat|
      @blogs += Post.joins(:categories).where("category_id=" + cat.to_s)
      @blogs = @blogs.uniq{|x| x.title}
    end
    
    @related_projects = []
    @cats.each do |cat|
      @related_projects += Project.joins(:categories).where("category_id=" + cat.to_s).reverse
      @related_projects = @related_projects.uniq{|x| x.projectname}
    end
    
    #pull in other children for "sponsor these too" 
    @otherchildren = Child__c.query("Number_of_Photos__c > 0 LIMIT 3")
    
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
    @trips = []
    unless @trip_participations == nil
      @trip_participations.each do | tripp |
        @trips << Trip__c.find_by_Id(tripp.Trip__c)
      end
    end
    respond_to do |format|
      format.html { render :layout => "homeLayout" }
    end
  end
  
  def tripshow
    @trip = Trip__c.find_by_Id(params[:tripid])
    
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