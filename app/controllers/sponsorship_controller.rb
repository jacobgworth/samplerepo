class SponsorshipController < ApplicationController
  def index
    @title = "Child Sponsorship: Help Children in Haiti by Becoming a Sponsor"
    @meta = "Help a child in Haiti who is in need through sponsorship.  Sponsorship provides children with food, care, clothing, shelter & education. Sponsor a child in Haiti today."
    @txtname = params[:fname]
    @txtemail = params[:email]
    @txtstreet = params[:address]
    @txtcity = params[:city]
    @txtstate = params[:state]
    @txtzip = params[:zip]
    
    if @txtname.nil? || @txtname == '' || @txtstreet.nil? || @txtstreet == '' || @txtcity.nil? || @txtcity == '' || @txtstate.nil? || @txtstate == '' || @txtzip.nil? || @txtzip == ''
      @isvalid = false
      @testrequest='first time'
    else
      @isvalid = true
      @prefs = " "
      if !params[:prefgirl].nil?
        @prefs = "Girl,"
      end
      if !params[:prefboy].nil?
        @prefs = @prefs + "Boy,"
      end
      if !params[:prefkinder].nil?
        @prefs = @prefs + "Kindergarten,"
      end
      if !params[:prefgrade].nil?
        @prefs = @prefs + "Grade School,"
      end
      if !params[:prefhigh].nil?
        @prefs = @prefs + "High School"
      end
      @data = {
        :childpreferences => @prefs,
        :fname => params[:fname], 
        :phone => params[:phonenumber],
        :fromaddress => params[:email], 
        :streetaddress => params[:address],
        :city => params[:city],
        :state => params[:state],
        :zip => params[:zip]        
      }
      
      @testrequest = @prefs
      ContactUsMailer.sponsorship_contact(@data).deliver
    end
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end
  


end
