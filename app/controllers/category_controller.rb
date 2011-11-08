class CategoryController < ApplicationController
  layout "header"
  def index  
@city= City.find(session[:city_id])
@dealss=Deal.where("category_id =? AND city_id=?",Category.find(2),session[:city_id]).includes(:stores,:comments)
@search = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).search(params[:search])
@category=Category.find(2)
 #comment alert
   if user_signed_in?
     @mydeals=current_user.deals.includes(:stores,:comments)
     @comments = @mydeals.first.comments.includes(:user)
     @last_signed=current_user.last_sign_in_at
     @old_comments=@comments.where("created_at < ?",@last_signed).count
     @new_comments=@comments.count-@old_comments
     end

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
 #comment alert
   if user_signed_in?
     @mydeals=current_user.deals.includes(:stores,:comments)
     @comments = @mydeals.first.comments.includes(:user)
     @last_signed=current_user.last_sign_in_at
     @old_comments=@comments.where("created_at < ?",@last_signed).count
     @new_comments=@comments.count-@old_comments
     end

 end 
  
  def clothing
    @city= City.find(session[:city_id])
    @dealss=Deal.where("category_id =? AND city_id=?",Category.find(4),session[:city_id]).includes(:stores)
    @search = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).search(params[:search])
    @category=Category.find(4)
     #comment alert
   if user_signed_in?
     @mydeals=current_user.deals.includes(:stores,:comments)
     @comments = @mydeals.first.comments.includes(:user)
     @last_signed=current_user.last_sign_in_at
     @old_comments=@comments.where("created_at < ?",@last_signed).count
     @new_comments=@comments.count-@old_comments
     end

 end

  def new
   @category=Category.new 
  end

  def health
    @city= City.find(session[:city_id])
    @dealss=Deal.where("category_id =? AND city_id=?",Category.find(3),session[:city_id]).includes(:stores)
    @search = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).search(params[:search])
    @category=Category.find(3)
     #comment alert
   if user_signed_in?
     @mydeals=current_user.deals.includes(:stores,:comments)
     @comments = @mydeals.first.comments.includes(:user)
     @last_signed=current_user.last_sign_in_at
     @old_comments=@comments.where("created_at < ?",@last_signed).count
     @new_comments=@comments.count-@old_comments
     end

end

  def entertain
    @city= City.find(session[:city_id])
    @dealss=Deal.where("category_id =? AND city_id=?",Category.find(6),session[:city_id]).includes(:stores)
    @search = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).search(params[:search])
    @category=Category.find(6)
     #comment alert
   if user_signed_in?
     @mydeals=current_user.deals.includes(:stores,:comments)
     @comments = @mydeals.first.comments.includes(:user)
     @last_signed=current_user.last_sign_in_at
     @old_comments=@comments.where("created_at < ?",@last_signed).count
     @new_comments=@comments.count-@old_comments
     end

end 

   def restaurant
    @city= City.find(session[:city_id])
    @dealss=Deal.where("category_id =? AND city_id=?",Category.find(5),session[:city_id]).includes(:stores)
    @search = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).search(params[:search])
    @category=Category.find(5)
     #comment alert
   if user_signed_in?
     @mydeals=current_user.deals.includes(:stores,:comments)
     @comments = @mydeals.first.comments.includes(:user)
     @last_signed=current_user.last_sign_in_at
     @old_comments=@comments.where("created_at < ?",@last_signed).count
     @new_comments=@comments.count-@old_comments
     end

 end

   def activity
    @city= City.find(session[:city_id])
    @dealss=Deal.where("category_id =? AND city_id=?",Category.find(7),session[:city_id]).includes(:stores)
    @search = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).search(params[:search])
    @category=Category.find(7)
     #comment alert
   if user_signed_in?
     @mydeals=current_user.deals.includes(:stores,:comments)
     @comments = @mydeals.first.comments.includes(:user)
     @last_signed=current_user.last_sign_in_at
     @old_comments=@comments.where("created_at < ?",@last_signed).count
     @new_comments=@comments.count-@old_comments
     end

end

  

end
