class User < ActiveRecord::Base
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
    #send new data to convio if there is an account linked
    unless self.convio_id == nil
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
  end
  
  #need a way to save on step2 if no convio_id
  def convio_link
    #link a user account to a convio account
    @contact = Contact.find_by_Email(self.email)
    
    unless @contact == nil
      self.convio_id = @contact.Id
    end
    
    #if no convio account found, we need to create one
  end
  
end
