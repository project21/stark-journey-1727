class CategoryController < ApplicationController
  layout "header"
  def index  
@city= City.find(session[:city_id])
@dealss=Deal.where("category_id =? AND city_id=?",Category.find(5),session[:city_id]).includes(:stores,:comments).rank_tally(:limit=>24)
@search = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).search(params[:search])
@category=Category.find(5)
 #comment alert
   @total_comments=0
     if user_signed_in?
     @mydeals=current_user.deals.includes(:stores,:comments,:user)
     @mydeals.each do |mydeal|
      @comments=mydeal.comments
     @last_signed=current_user.last_sign_in_at
     @old_comments=@comments.where("created_at < ?",@last_signed).count
     @new_comments=@comments.count-@old_comments
     @total_comments+=@new_comments
         end
     end
  end

def electro
@city= City.find(session[:city_id])
@dealss=Deal.where("category_id =? AND city_id=?",Category.find(6),session[:city_id]).includes(:stores).rank_tally(:limit=>24)
@search = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).search(params[:search])
@category=Category.find(6)
 #comment alert
   @total_comments=0
     if user_signed_in?
     @mydeals=current_user.deals.includes(:stores,:comments,:user)
     @mydeals.each do |mydeal|
      @comments=mydeal.comments
     @last_signed=current_user.last_sign_in_at
     @old_comments=@comments.where("created_at < ?",@last_signed).count
     @new_comments=@comments.count-@old_comments
     @total_comments+=@new_comments
         end
     end
 end 
  
  def clothing
    @city= City.find(session[:city_id])
    @dealss=Deal.where("category_id =? AND city_id=?",Category.find(7),session[:city_id]).includes(:stores).rank_tally(:limit=>24)
    @search = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).search(params[:search])
    @category=Category.find(7)
     #comment alert
   @total_comments=0
     if user_signed_in?
     @mydeals=current_user.deals.includes(:stores,:comments,:user)
     @mydeals.each do |mydeal|
      @comments=mydeal.comments
     @last_signed=current_user.last_sign_in_at
     @old_comments=@comments.where("created_at < ?",@last_signed).count
     @new_comments=@comments.count-@old_comments
     @total_comments+=@new_comments
         end
     end

 end

  def new
   @category=Category.new 
  end

def jewelry
    @city= City.find(session[:city_id])
    @dealss=Deal.where("category_id =? AND city_id=?",Category.find(9),session[:city_id]).includes(:stores).rank_tally(:limit=>24)
    @search = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).search(params[:search])
    @category=Category.find(9)
     #comment alert
   @total_comments=0
     if user_signed_in?
     @mydeals=current_user.deals.includes(:stores,:comments,:user)
     @mydeals.each do |mydeal|
      @comments=mydeal.comments
     @last_signed=current_user.last_sign_in_at
     @old_comments=@comments.where("created_at < ?",@last_signed).count
     @new_comments=@comments.count-@old_comments
     @total_comments+=@new_comments
         end
     end

 end

 def kids
    @city= City.find(session[:city_id])
    @dealss=Deal.where("category_id =? AND city_id=?",Category.find(10),session[:city_id]).includes(:stores).rank_tally(:limit=>24)
    @search = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).search(params[:search])
    @category=Category.find(10)
     #comment alert
   @total_comments=0
     if user_signed_in?
     @mydeals=current_user.deals.includes(:stores,:comments,:user)
     @mydeals.each do |mydeal|
      @comments=mydeal.comments
     @last_signed=current_user.last_sign_in_at
     @old_comments=@comments.where("created_at < ?",@last_signed).count
     @new_comments=@comments.count-@old_comments
     @total_comments+=@new_comments
         end
     end

 end

 def home_improve
    @city= City.find(session[:city_id])
    @dealss=Deal.where("category_id =? AND city_id=?",Category.find(12),session[:city_id]).includes(:stores).rank_tally(:limit=>24)
    @search = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).search(params[:search])
    @category=Category.find(12)
     #comment alert
   @total_comments=0
     if user_signed_in?
     @mydeals=current_user.deals.includes(:stores,:comments,:user)
     @mydeals.each do |mydeal|
      @comments=mydeal.comments
     @last_signed=current_user.last_sign_in_at
     @old_comments=@comments.where("created_at < ?",@last_signed).count
     @new_comments=@comments.count-@old_comments
     @total_comments+=@new_comments
         end
     end

 end

  def health
    @city= City.find(session[:city_id])
    @dealss=Deal.where("category_id =? AND city_id=?",Category.find(13),session[:city_id]).includes(:stores).rank_tally(:limit=>24)
    @search = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).search(params[:search])
    @category=Category.find(13)
     #comment alert
   @total_comments=0
     if user_signed_in?
     @mydeals=current_user.deals.includes(:stores,:comments,:user)
     @mydeals.each do |mydeal|
      @comments=mydeal.comments
     @last_signed=current_user.last_sign_in_at
     @old_comments=@comments.where("created_at < ?",@last_signed).count
     @new_comments=@comments.count-@old_comments
     @total_comments+=@new_comments
         end
     end

end

  def houseware
    @city= City.find(session[:city_id])
    @dealss=Deal.where("category_id =? AND city_id=?",Category.find(8),session[:city_id]).includes(:stores).rank_tally(:limit=>24)
    @search = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).search(params[:search])
    @category=Category.find(8)
     #comment alert
   @total_comments=0
     if user_signed_in?
     @mydeals=current_user.deals.includes(:stores,:comments,:user)
     @mydeals.each do |mydeal|
      @comments=mydeal.comments
     @last_signed=current_user.last_sign_in_at
     @old_comments=@comments.where("created_at < ?",@last_signed).count
     @new_comments=@comments.count-@old_comments
     @total_comments+=@new_comments
         end
     end

end 

   def restaurant
    @city= City.find(session[:city_id])
    @dealss=Deal.where("category_id =? AND city_id=?",Category.find(11),session[:city_id]).includes(:stores).rank_tally(:limit=>24)
    @search = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).search(params[:search])
    @category=Category.find(11)
     #comment alert
   @total_comments=0
     if user_signed_in?
     @mydeals=current_user.deals.includes(:stores,:comments,:user)
     @mydeals.each do |mydeal|
      @comments=mydeal.comments
     @last_signed=current_user.last_sign_in_at
     @old_comments=@comments.where("created_at < ?",@last_signed).count
     @new_comments=@comments.count-@old_comments
     @total_comments+=@new_comments
         end
     end

 end

   def activity
    @city= City.find(session[:city_id])
    @dealss=Deal.where("category_id =? AND city_id=?",Category.find(14),session[:city_id]).includes(:stores).rank_tally(:limit=>24)
    @search = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).search(params[:search])
    @category=Category.find(14)
     #comment alert
   @total_comments=0
     if user_signed_in?
     @mydeals=current_user.deals.includes(:stores,:comments,:user)
     @mydeals.each do |mydeal|
      @comments=mydeal.comments
     @last_signed=current_user.last_sign_in_at
     @old_comments=@comments.where("created_at < ?",@last_signed).count
     @new_comments=@comments.count-@old_comments
     @total_comments+=@new_comments
         end
     end
end

end
