class ApplicationController < ActionController::Base
  LocalUser = User
  LocalComm = Community
  include Databasedotcom::Rails::Controller
  Community = LocalComm
  User = LocalUser
  protect_from_forgery
  
  helper_method :current_user
  
  private
  #def current_user
  #  @current_user ||= User.find(session[:user_id]) if session[:user_id]
  #end
  
  def convio_api_session()
    require "ConstituentManagementSession"
    ConvioSession.secure_domain="https://secure3.convio.net/mohh"
    ConvioSession.response_format="json"
    ConvioSession.api_key="mohhapi"
    ConstituentManagementSession.login_name="threetwelve"
    ConstituentManagementSession.login_password="hope_is_our_mission"
    ConstituentManagementSession.new()
  end
  
  def current_user
    if cookies[:auth_token] != nil
      session[:user_id] = User.find_by_auth_token!(cookies[:auth_token]).id
      @current_user = User.find_by_auth_token!(cookies[:auth_token]) 
    else
      if session[:user_id] != nil
        @current_user = User.find(session[:user_id])
        cookies[:auth_token] = @current_user.auth_token
      else
        @current_user = nil
      end
    end
  end
  
  def is_logged_in?
    if session[:user_id] != nil || cookies[:auth_token] != nil
      session[:user_id] = User.find_by_auth_token(cookies[:auth_token]).id if cookies[:auth_token]
      return true
    else
      return false
    end
    
  end
  
  def is_admin_user?
    if is_logged_in?
      if current_user().email == "dsdewhir@gmail.com" || current_user().email == "david@threetwelvecreative.com" || current_user().email=="cammie@mohhaiti.org" || current_user().email == "elizabeth@mohhaiti.org" || current_user().email == "nmdewhirst@gmail.com" || current_user().email == "lindsey@mohhaiti.org" || current_user().email == "jesse@threetwelvecreative.com" || current_user().email == "jeremy@mohhaiti.org"
        return true
      else
        return false
      end
    else
      return false
    end
  end
  
  def create_convio_contact(last, first, email)
    @contact = Contact.create(
      :LastName => last,
      :FirstName => first,
      :Email => email,
      #NEEDS PHONE!
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
      :OwnerId => "005U0000000gMKq"
    )
  end
end
