class MymohController < ApplicationController
  include Databasedotcom::Rails::Controller
  
  def account
    @account = Contact.find_by_Id(current_user.convio_id)
    respond_to do |format|
      format.html {render :layout=>"homeLayout"} 
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
  
end