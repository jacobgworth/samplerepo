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
    @category = Category.find_by_categoryname("Orphanage")
    @projects = Project.joins(:categories).where("category_id=" + @category.id.to_s).last(6).reverse
    @posts = Post.joins(:categories).where("category_id=" + @category.id.to_s).last(3).reverse
    @updates = Update.joins(:categories).where("category_id=" + @category.id.to_s).last(3).reverse
    
    @jason = @projects.to_gmaps4rails
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# orphan_care.html.erb
    end
  end
  def education
    @category = Category.find_by_categoryname("Education")
    @projects = Project.joins(:categories).where("category_id=" + @category.id.to_s).last(6).reverse
    @posts = Post.joins(:categories).where("category_id=" + @category.id.to_s).last(3).reverse
    @updates = Update.joins(:categories).where("category_id=" + @category.id.to_s).last(3).reverse
    @villages = Community.joins(:projects=>:categories).where("category_id=?",@category.id.to_s)
    
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# orphan_care.html.erb
    end
  end
  def console
    unless is_admin_user?
      respond_to do |format|
        format.html { redirect_to "/" }
      end
    else
      respond_to do |format|
        format.html {render :layout=>"homeLayout"}# console.html.erb
      end
    end
  end
end
