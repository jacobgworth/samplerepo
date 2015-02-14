class UserMailer < ActionMailer::Base
  default from: "noreply@mohhaiti.org"
  
  def contact_us_mail(data)
    
    @data = data
    
    @body = @data[:body]
    @fromaddress = @data[:fromaddress]
    @subject = @data[:subject]
    @name = @data[:name]
    @phone = @data[:phone]
    mail(:to => "lindsey@mohhaiti.org", :subject => @subject, :from => @fromaddress)
  end
  
  def new_intern_app_notify(app_id)
    @intern = Intern.find(app_id)
    #mail(:to => "dsdewhir@gmail.com", :subject => "New Intern Application Has Been Uploaded", :from => "noreply@mohhaiti.org", :bcc=>"david.dewhirst@threetwelvecreative.com")
    mail(:to => "internships@mohhaiti.org", :subject => "New Intern Application Has Been Uploaded", :from => "noreply@mohhaiti.org")
  end
  
  def password_reset(user)
    @user = user
    mail :to => user.email, :subject => "Password Reset"
  end
  
  def welcome_new_user(user)
    @user = user
    mail(:to => @user.email, :subject => "Welcome to Mission of Hope, Haiti", :from => "noreply@mohhaiti.org", :bcc => "investorcare@mohhaiti.org, david@threetwelvecreative.com")
  end
  
  
end
