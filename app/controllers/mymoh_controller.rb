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
  
end