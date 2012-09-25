class ContactUsMailer < ActionMailer::Base
  
  def contact_us_mail(data,msgbody)
    
    @data = data
    
    @msgbody = msgbody#@data[:bodym]
    @fromaddress = @data[:fromaddress]
    @emailsubject = @data[:subject]
    @name = @data[:name]
    @phone = @data[:phone]
    mail(:to => "lindsey@mohhaiti.org", :subject => @emailsubject, :from => @fromaddress, :bcc=>"david.dewhirst@threetwelvecreative.com")
  end
  
end
