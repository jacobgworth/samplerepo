class ConnectedController < ApplicationController
  def index
    
    @posts = Post.order("postdate desc").take(5)
    @updates = Update.order("postdate desc").take(3)
    @videos = Video.last(3).reverse
    @user = current_user
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# connected.html.erb
    end
  end
end