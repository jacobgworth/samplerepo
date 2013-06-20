class ContactUsMailer < ActionMailer::Base
  #"info@mohhaiti.org"
  def church_partner(data)
    #change this to churchpartnerships@mohhaiti.org after testing
    @data = data
    
    @txtname = @data[:txtname]
    @txtphone = @data[:txtphone]
    @txtemail = @data[:txtemail]
    @txtaddress = @data[:txtaddress]
    @txtcity = @data[:txtcity]
    @txtstate = @data[:txtstate]
    @txtzip = @data[:txtzip]
    @txtchurchname = @data[:txtchurchname]
    @txtchurchaddress = @data[:txtchurchaddress]
    @txtchurchcity = @data[:txtchurchcity]
    @txtchurchstate = @data[:txtchurchstate]
    @txtchurchzip = @data[:txtchurchzip]
    @txtchurchwebsite = @data[:txtchurchwebsite]
    @txtpastorname = @data[:txtpastorname]
    @txtpastorphone = @data[:txtpastorphone]
    @txtmissionname = @data[:txtmissionname]
    @txtmissionphone = @data[:txtmissionphone]
    @txtcomments = @data[:txtcomments]
    @txtprefs = @data[:txtprefs]
    
    mail(:to => "churchpartnerships@mohhaiti.org", :subject => "Church Partnership Inquiry", :from => @txtemail)
  end
  
  def contact_us_mail(data,msgbody)
    
    @data = data
    
    @msgbody = msgbody#@data[:bodym]
    @fromaddress = @data[:fromaddress]
    @emailsubject = @data[:subject]
    @name = @data[:name]
    @phone = @data[:phone]
    mail(:to => "info@mohhaiti.org", :subject => @emailsubject, :from => @fromaddress)
  end
  
  def sponsorship_contact(data)
     
    @data = data
    
    @childpreferences = @data[:childpreferences]
    @fname = @data[:fname]
    @phone = @data[:phone]
    @fromaddress = @data[:fromaddress]
    @streetaddress = @data[:streetaddress]
    @city = @data[:city]
    @state = @data[:state]
    @zip = @data[:zip]  
    
    mail(:to => "sponsorship@mohhaiti.org", :subject => "Child Sponsorship Inquiry", :from => @fromaddress)
  end
  
  def write_child(data)
    #change this to sponsorship@mohhaiti.org after testing
    
    @data = data
    
    @fname = @data[:fname] + @data[:lname]
    @phone = @data[:phone]
    @fromaddress = @data[:fromaddress]
    @bodym = @data[:bodym]
    @childname = @data[:childname]
    @childnumber = @data[:childnumber]
    @attachment = @data[:attachment]
    if !@attachment.nil?
      attachments[@attachment.original_filename] = @attachment.read
    end
    
    mail(:to => "jesse+test@threetwelvecreative.com", :subject => "Write My Child", :from => @fromaddress)
  end
  
  def take_a_trip(data)
    #change this to missiontrips@mohhaiti.org after testing
    
    @data = data
    
    @fullname = @data[:fname]
    @phone = @data[:phone]
    @fromaddress = @data[:fromaddress]
    @comments = @data[:comments]
    @medical = @data[:medical]
    @toemail = "missiontrips@mohhaiti.org"
    if (@data[:medical] == "on")
       @toemail = "medical@mohhaiti.org" 
    end
    #@toemail = "jesse@threetwelvecreative.com" #testing
    
    mail(:to => @toemail, :subject => "Take a Mission Trip", :from => @fromaddress)
  end
  
  def volunteer(data)
    #change this to info@mohhaiti.org after testing
    
    @data = data
    
    @txtname = @data[:txtname]
    @txtphonenumber = @data[:txtphonenumber]
    @txtemail = @data[:txtemail]
    @txtmessage = @data[:txtmessage]
    
    @frizzle = @data[:txtname]
    
    mail(:to => "info@mohhaiti.org", :subject => "MOH Volunteer", :from => @txtemail)
  end
  
  def vision_trip(data)
    #change this to churchpartnerships@mohhaiti.org after testing
    
    @data = data
    
    @txtfirst = @data[:txtfirst]
    @txtlast = @data[:txtlast]
    @txtphone = @data[:txtphone]
    @txtemail = @data[:txtemail]
    @txtchurch = @data[:txtchurch]
    @txtcity = @data[:txtcity]
    @txtstate = @data[:txtstate]
    @txtzip = @data[:txtzip]
    @txtmessage = @data[:txtmessage]
    @txtdatesinterested = @data[:txtdatesinterested]
    
    mail(:to => "churchpartnerships@mohhaiti.org", :subject => "Vision Trip Information", :from => @txtemail)
  end
  
end
