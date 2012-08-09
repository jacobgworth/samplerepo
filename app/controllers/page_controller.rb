class PageController < ApplicationController
  def what_we_do
  end
  
  def what_we_do
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end
    
  def haiti_one
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end
  
  def orphan_care
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# orphan_care.html.erb
    end
  end
  def education
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# orphan_care.html.erb
    end
  end
  def console
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# console.html.erb
    end
  end
end
