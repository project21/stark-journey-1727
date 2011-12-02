  class DealController < ApplicationController
  respond_to :js
  before_filter :authenticate_user!, :only=>[:create,:retailers]
  layout "header"
  def index
     unless session[:city_id].nil? || session[:city_id].blank?
     @city = City.find(session[:city_id])
   
    @deals=Deal.where("city_id = ?", session[:city_id]).includes( :stores).rank_tally()
     @search = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).search(params[:search])
   end
  end

  def create
   @search = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).search(params[:search])  
  @city = City.find(session[:city_id])
  @deal=@city.deals.build(params[:deal])
   if @deal.save
    redirect_to @deal
     flash[:notice]="Thank you for sharing the deal with us,you can view it on your profile"
    else
    render 'new' 
    flash[:error]="Error occured,the deal was not saved"
  end 
  end

   def retailer_create
  @search = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).search(params[:search])  
  @city = City.find(session[:city_id])
  @deal=@city.deals.build(params[:deal])
   if @deal.save
    redirect_to @deal
     flash[:notice]="Thank you for choosing spotsaving,you can view your deals on your profile"
    else
    render 'retailers' 
    flash[:error]="Error occured,data was not saved"
      @total_comments=0
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
  
  def show
    unless session[:city_id].nil? || session[:city_id].blank?
     @city = City.find_by_id(session[:city_id])
     @deals=Deal.where("city_id = ?", session[:city_id]).includes( :stores).rank_tally(:limit=>24)
     @search = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).search(params[:search])
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
 else
     redirect_to :controller=>"home" ,:action=>"index" 
 end
 
end 

def vote_up
    @city = City.find(session[:city_id])
     @store_deals=StoreDeal.where("stores.city_id = ?", session[:city_id]).includes(:deal, :store)
     @search = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).search(params[:search])
     @items=Deal.find(params[:id])
if user_signed_in?
  unless current_user.voted_for?(@items) || current_user.voted_against?(@items) 
    current_user.vote_for(@items)
    flash.now[:notice]="Thank you for voting"
  else
    flash.now[:error]="Sorry you already voted for this deal"
    respond_with(@items,:layout => !request.xhr?)
  end  

else

 flash.now[:error]="You have to login or sign up to vote for this deal "
end
end 
   # render :nothing => true, :status => 200
 # rescue ActiveRecord::RecordInvalid
  #  render :nothing => true, :status => 404
  
 #   end
 def vote_down
     @city = City.find(session[:city_id])
     @store_deals=StoreDeal.where("stores.city_id = ?", session[:city_id]).includes(:deal, :store)
     @search = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).search(params[:search])
     @items=Deal.find(params[:id])
if user_signed_in?
    unless current_user.voted_for?(@items) || current_user.voted_against?(@items)
    current_user.vote_against(@items)
    flash.now[:notice]="Thank you for voting"
    respond_with(@items,:layout => !request.xhr?)
    else
    flash.now[:error]="Sorry you already voted for this deal"
    respond_with(@items,:layout => !request.xhr?)
    end
 else
 flash.now[:error]="You have to login or sign up to vote for this deal "
 end  
end 

  def update 
     @city = City.find(session[:city_id])
     @search = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).search(params[:search])
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
       
       @deal= Deal.find(params[:id])
 
    if @deal.update_attributes(params[:deal])
      redirect_to :action => 'show'
      flash[:notice]="Thank you ,your deal has been updated,you can view it on your profile"
    else
      render :edit
    end
  end 

  def new
   @deal=Deal.new 
   @city = City.find(session[:city_id])
   @deal = @city.deals.build
   @deal.stores.build
   if user_signed_in? 
   current_user.deals.build
 end
   @deal.build_category
   #mention time (how long the deal is going to be till)
   @search = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).search(params[:search])
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

  def all_cities
   @cities=City.find(:all)
    unless session[:city_id].nil? || session[:city_id].blank?
      @city = City.find(session[:city_id])
    end
  #@city=City.find(params[:city_id]) 
 # session[:city_id] = @city.id
 @search = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).search(params[:search])
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

  def city
    @city=City.find(params[:city_id]) 
   session[:city_id] = @city.id
   redirect_to :controller=>"deal",:action=>"show"
  end  

  def new_deals
    unless session[:city_id].nil? || session[:city_id].blank?
      @city = City.find(session[:city_id])
    end  
  @search = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).search(params[:search])
  @deals = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).order("created_at DESC").limit(18)
  @deals.each do |deal|
  unless deal.fixed_price
       unless deal.n_item_free.nil?
        @off_free=deal.n_item_free
      else 
        @off_free=deal.percent_off
       end 
    end 
    end  
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

  def retailers
    @deal=Deal.new 
     unless session[:city_id].nil? || session[:city_id].blank?
      @city = City.find(session[:city_id])
    end
    @search = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).search(params[:search])
     @deal = @city.deals.build
    @deal.stores.build
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

  def search
    @city = City.find(session[:city_id])
     @search = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).search(params[:search])
    @deals = @search.all
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

def flagg
if user_signed_in?  
@deal=Deal.find(params[:id])
unless @deal.flagged
@deal.update_attribute(:flagged,true)
flash.now[:error]="You have flagged this deal,we will take care of it"
respond_with(:layout => !request.xhr?)
else
  flash.now[:error]="This deal has already been flagged"
end

else
flash.now[:error]="You have to login or sign up to flag this deal"
end
end
 
   
  def profile
      @city = City.find(session[:city_id])
      @search = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).search(params[:search])
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

def how_it_works
  @city = City.find(session[:city_id])
      @search = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).search(params[:search])
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

def delete
    @deal=Deal.find(params[:id])
    @deal.destroy
    redirect_to :controller=>"deal",:action=>"profile"
end

def edit
    @city = City.find(session[:city_id])
     @search = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).search(params[:search])
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
    @deal=Deal.find(params[:id])
  
end

def edit_retailer
    @city = City.find(session[:city_id])
     @search = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).search(params[:search])
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
    @deal=Deal.find(params[:id])
  
end

end
