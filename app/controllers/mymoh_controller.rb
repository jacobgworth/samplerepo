class MymohController < ApplicationController
  include Databasedotcom::Rails::Controller
  before_filter :require_login
  
  def require_login
    if current_user == nil
      redirect_to "/log_in"
    end
  end
  
  def index
      @account = Contact.find_by_Id(current_user.convio_id)
      respond_to do | format |
        format.html { render :layout=>"homeLayout"}
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
    @sponsorships = Child_Sponsorship__c.find_by_Sponsor__c(@account.Id)
    unless @sponsorships == nil
      @child = Child__c.find_by_Id(@sponsorships.Child__c)
    end
    unless @child == nil
      @photo = Picture__c.find_by_Child__c(@child.Id).Photo__c
    end
    respond_to do |format|
      format.html {render :layout=>"homeLayout"} 
    end
  end 
  
  def mytrips
    @contact = Contact.find_by_Id(current_user.convio_id)
    @trip_participations = Trip_Participation__c.query("Contact__c = '" + @contact.Id + "'")
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
  
end