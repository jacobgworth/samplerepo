class User < ActiveRecord::Base
  
  include Databasedotcom::Rails::Controller
  attr_accessor :password
  before_save :encrypt_password, :convio_sync
  
  has_many :updates
  has_many :experiences
  has_many :posts
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  
  attr_accessible :auth_token,:user_name,:first,:last,:email,:password,:password_confirmation,:zip,:street1,:city,:state,:is_admin
  
  #Comment Login-specific functionality starts here
  before_save :encrypt_password
  
  before_create { generate_token(:auth_token) }
  
  def convio_api_session
    require "ConstituentManagementSession"
    ConvioSession.secure_domain="https://secure3.convio.net/mohh"
    ConvioSession.response_format="json"
    ConvioSession.api_key="mohhapi"
    ConstituentManagementSession.login_name="threetwelve"
    ConstituentManagementSession.login_password="hope_is_our_mission"
    ConstituentManagementSession.new()
  end
  
  def get_interests()
    @interests = []
    unless self.convio_id.nil?
      c = convio_api_session
      interest_hash = c.getUserInterests(Contact.find_by_Id(self.convio_id).cv__Convio_ID__c.to_i)
      puts "GETTING INTERESTS FOR USER: " + self.convio_id.to_s
      if (interest_hash["getConsInterestsResponse"]["interest"][0] == nil)
        @interests << interest_hash["getConsInterestsResponse"]["interest"]["id"]
      else
        interest_hash["getConsInterestsResponse"]["interest"].each do |item|
          @interests << item["id"]
        end
      end
    end
    @interests
  end
  
  
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
  
  def self.authenticate(email, password)
    user = find_by_email(email)
    #user = find(:first,:conditions=>['lower(email) = :email',:email=>email.downcase])
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def convio_sync
    #most cases have a convio_id. if so, send the new data
    unless self.convio_id == "" || self.convio_id == nil  
      convio_update #send the data from local to convio
    else
      #no convio_id
      @contact = convio_match #try to find a match for this person
      unless @contact == nil
        self.convio_id = @contact.Id
        local_sync #update our data with that of convio
      else
        #we can't find anyone, make a new convio account unless this person was JUST created
        #if they're just created, they'll have a password in params?
        unless self.last == "" || self.last == nil
          @contact = convio_new
          self.convio_id = @contact.Id
        end
      end
    end
  end
  
  def convio_new
    #@user = User.find_by_Email("312@mohhaiti.org")
    @sfcontact = Contact.create(
      :LastName => self.last,
      :FirstName => self.first,
      :Email => self.email,
      :MailingStreet => self.street1,
      :MailingCity => self.city,
      :MailingState => self.state,
      :MailingPostalCode => self.zip,
      :HasOptedOutOfEmail => false,
      :HasOptedOutOfFax => false,
      :DoNotCall => false,
      :cv__Create_Household__c => true,
      :cv__Deceased__c => false,
      :cv__Head_of_Household__c => false,
      :cv__Postal_Mail_Opt_Out__c => false,
      :cv__Active__c => false,
      :cv__Active_Sustainer__c => false,
      :cv__Open_Major_Gift__c => false,
      :cv__Anonymous__c => false,
      :cv__Do_Not_Synchronize__c => false,
      :International__c => false,
      :Church__c => false,
      :University__c => false,
      :Intern__c => false,
      :Group_Trip_Vision_Trip__c => false,
      :Group_Trip_Prospect__c => false,
      :Medical_Trip_Prospect__c => false,
      :MD_DO__c => false,
      :RN__c => false,
      :NP__c => false,
      :PA__c => false,
      :PT__c => false,
      :OT__c => false,
      :CNA__c => false,
      :Paramedic_EMT__c => false,
      :DDS__c => false,
      :Dental_Hygenist_Assistant__c => false,
      :Carpentry__c => false,
      :Welding__c => false,
      :Concrete_Finisher__c => false,
      :Masonry__c => false,
      :Heavy_Machinery__c => false,
      :Metal_Roofing__c => false,
      :Engineering__c => false,
      :Electrical__c => false,
      :Plumbing__c => false,
      :Small_Engine_Mechanics__c => false,
      :Diesel_Mechanics__c => false,
      :Automotive_Mechanics__c => false,
      :Generator_Mechanics__c => false,
      :Computer_Repair__c => false,
      :Computer_Networking__c => false,
      :Medical_Face_Sheet__c => false,
      :Copy_of_Diploma__c => false,
      :Sync_to_CLO__c => true,
      :MyMOH_Signup_Date__c => Date.today,
      :OwnerId => "005U0000000gMKq"
    )
    #@sfcontact.save
    puts "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" + @sfcontact.Id
    @sfcontact
  end
  
  def convio_update
    #send new data to convio if there is an account linked
    #opposite is local_sync
      @sfcontact = Contact.find_by_Id(self.convio_id)
      
      #Convio contact exists, so update it with new values
      @sfcontact.LastName = self.last
      @sfcontact.FirstName = self.first
      @sfcontact.Email = self.email
      @sfcontact.MailingStreet = self.street1
      @sfcontact.MailingCity = self.city
      @sfcontact.MailingState = self.state
      @sfcontact.MailingPostalCode = self.zip
      @sfcontact.save    
  end
  
  def convio_match
    @contact = convio_match_by_email || convio_match_by_detail
    if @contact
      puts "MATCHED CONVIO USER: " + @contact.FirstName
      @contact.MyMOH_Signup_Date__c = Date.today
      @contact.save
    end
    return @contact
  end
  
  def local_sync #sync local data to match what convio has
    #opposite is convio_update
    @contact = Contact.find_by_Id(self.convio_id.to_s)
    unless @contact == nil
      #update local data from matched account
      self.first = @contact.FirstName
      self.last = @contact.LastName
      self.state = @contact.MailingState
      self.city = @contact.MailingCity
      self.street1 = @contact.MailingStreet
      self.zip = @contact.MailingPostalCode
      self.convio_id = @contact.Id
    end
  end
  
  def convio_match_by_email
    #match a user account to a convio account with email address
    @contact = Contact.find_by_Email(self.email)
  end
  
  def convio_match_by_detail
    first = self.first || ""
    last = self.last || ""
    state = self.state || ""
    street = self.street1 || ""
    
    query = "FirstName = '" + first + "' AND LastName = '" + last + "' AND MailingState = '" + state + "' AND MailingStreet = '" + street + "' AND Email = ''"
    @contact = Contact.query(query).first #.first to avoid collection because nil/empty comparisons are different
    
    #this may not be good, think about it some?
    if @contact
      @contact.Email = self.email
      @contact.save
    end
    #end possible bad
    
    return @contact
  end
  
end
