class PageController < ApplicationController
  def what_we_do
  end
  
  def haiti_one
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end
  
  def orphan_care
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end
end
