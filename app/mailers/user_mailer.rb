class UserMailer < ActionMailer::Base
  default from: "noreply@mohhaiti.org"
  
  def contact_us_mail(data)
    
    @data = data
    
    @body = @data[:body]
    @fromaddress = @data[:fromaddress]
    @subject = @data[:subject]
    @name = @data[:name]
    @phone = @data[:phone]
    mail(:to => "lindsey@mohhaiti.org", :subject => @subject, :from => @fromaddress, :bcc=>"david.dewhirst@threetwelvecreative.com")
  end
  
  def password_reset(user)
    @user = user
    mail :to => user.email, :subject => "Password Reset"
  end
  
end
