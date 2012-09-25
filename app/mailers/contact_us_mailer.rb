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
  
  def sponsorship_contact(data)
    #change this to sponsorship@mohhaiti.org after testing
    
    @data = data
    
    @childpreferences = @data[:childpreferences]
    @fname = @data[:fname], 
    @phone = @data[:phone],
    @fromaddress = @data[:fromaddress], 
    @streetaddress = @data[:streetaddress],
    @city = @data[:city],
    @state = @data[:state],
    @zip = @data[:zip]  
    
    mail(:to => "sponsorship@mohhaiti.org", :subject => "Child Sponsorship Inquiry", :from => @fromaddress, :bcc=>"david.dewhirst@threetwelvecreative.com")
  end
  
end
