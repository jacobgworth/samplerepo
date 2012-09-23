class ConnectedController < ApplicationController
  def index
    
    @posts = Post. last(5).reverse
    @user = current_user
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# connected.html.erb
    end
  end
end