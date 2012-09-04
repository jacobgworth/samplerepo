class AdvancementController < ApplicationController
  def index
    
   @category = Category.find_by_categoryname("Church Advancement")
   @projects = Project.joins(:categories).where("category_id=" + @category.id.to_s).last(6).reverse
   @posts = Post.joins(:categories).where("category_id=" + @category.id.to_s).last(3).reverse
   @updates = Update.joins(:categories).where("category_id=" + @category.id.to_s).last(3).reverse
   @villages = Community.joins(:projects=>:categories).where("category_id=?",@category.id.to_s)
    
    
    respond_to do |format|
      format.html {render :layout=>"homeLayout"}# haiti_one.html.erb
    end
  end
end