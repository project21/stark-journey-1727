class CategoryController < ApplicationController
  layout "header"
  def index  
@city= City.find(session[:city_id])
@dealss=Deal.where("category_id =? AND city_id=?",Category.find(2),session[:city_id]).includes(:stores,:comments)
@search = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).search(params[:search])
@category=Category.find(2)
#@comments=@dealss.comments
#@store_id=@deal.store_deals
   # @deal=@deals.find_with_ids(1)
  #@categories=@city.categories
  # @category=@categories.find_with_ids(2)
   #	@deal=@category.deals
  #	@deal=@category.deals
 # @category=Category.all
  #@deal=@category.deals
  #@store_deals=StoreDeal.where("stores.city_id = ? AND category_id?", session[:city_id],Category.find(2))
  end

def electro
@city= City.find(session[:city_id])
@dealss=Deal.where("category_id =? AND city_id=?",Category.find(1),session[:city_id]).includes(:stores)
@search = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).search(params[:search])
@category=Category.find(1)
 end 
  
  def clothing
    @city= City.find(session[:city_id])
    @dealss=Deal.where("category_id =? AND city_id=?",Category.find(4),session[:city_id]).includes(:stores)
    @search = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).search(params[:search])
    @category=Category.find(4)
 end

  def new
   @category=Category.new 
  end

  def health
    @city= City.find(session[:city_id])
    @dealss=Deal.where("category_id =? AND city_id=?",Category.find(3),session[:city_id]).includes(:stores)
    @search = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).search(params[:search])
    @category=Category.find(3)
end

  def entertain
    @city= City.find(session[:city_id])
    @dealss=Deal.where("category_id =? AND city_id=?",Category.find(6),session[:city_id]).includes(:stores)
    @search = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).search(params[:search])
    @category=Category.find(6)
end 

   def restaurant
    @city= City.find(session[:city_id])
    @dealss=Deal.where("category_id =? AND city_id=?",Category.find(5),session[:city_id]).includes(:stores)
    @search = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).search(params[:search])
    @category=Category.find(5)
 end

   def activity
    @city= City.find(session[:city_id])
    @dealss=Deal.where("category_id =? AND city_id=?",Category.find(7),session[:city_id]).includes(:stores)
    @search = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).search(params[:search])
    @category=Category.find(7)
end

  

end
