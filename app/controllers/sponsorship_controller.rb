class SponsorshipController < ApplicationController
  def index
    
    if params[:fname].nil? || params[:fname] == ""
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
