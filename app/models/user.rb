class User < ActiveRecord::Base
  attr_accessor :password
  before_save :encrypt_password, :convio_save
  
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
  
  def convio_save
    unless self.convio_id == nil
      @sfcontact = Contact.find_by_Id(self.convio_id)
    else
      @sfcontact = Contact.find_by_Email(self.email)
    end
    if (@sfcontact == nil)
        #convio contact doesn't exist so create one, it's a new signup
        @sfcontact = Contact.create(
          :LastName => self.last,
          :FirstName => self.first,
          :Email => self.email,
          :MailingStreet => self.street1,
          :MailingCity => self.city,
          :MailingState => self.state,
          :MailingPostalCode => self.zip
        )
    else
        unless self.convio_id == nil
          #Convio contact exists, so update it with new values
          @sfcontact.LastName = self.last
          @sfcontact.FirstName = self.first
          @sfcontact.Email = self.email
          @sfcontact.MailingStreet = self.street1
          @sfcontact.MailingCity = self.city
          @sfcontact.MailingState = self.state
          @sfcontact.MailingPostalCode = self.zip
        end
    end
    self.convio_id = @sfcontact.Id
    @sfcontact.save    
  end
  
end
