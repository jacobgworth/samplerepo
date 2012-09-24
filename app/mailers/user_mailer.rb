class UserMailer < ActionMailer::Base
  
  def contact_us_mail(data)
    
    @data = data
    
    @body = @data[:body]
    @fromaddress = @data[:fromaddress]
    @subject = @data[:subject]
    @name = @data[:name]
    @phone = @data[:phone]
    mail(:to => "lindsey@mohhaiti.org", :subject => @subject, :from => @fromaddress, :bcc=>"david.dewhirst@threetwelvecreative.com")
  end
  
end
