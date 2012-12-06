class MymohController < ApplicationController
  include Databasedotcom::Rails::Controller
  
  def account
    @account = Contact.find_by_Id(current_user.convio_id)
    respond_to do |format|
      format.html {render :layout=>"homeLayout"} 
    end
  end
  
  def giving
    #@contact = Contact.find_by_Id(current_user.convio_id)
    @account = Contact.find_by_Name("Joseph Leake")
    respond_to do | format |
      format.html { render :layout => "homeLayout" }
    end
    @cl = dbdc_client
    rg = @cl.materialize("cv__Recurring_Gift__c")
    @recurring = rg.last
  end
  
end