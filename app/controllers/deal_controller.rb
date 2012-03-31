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
    @cities=City.find(:all)
    @search = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).search(params[:search])  
    @city = City.find(session[:city_id])
    @points=current_user.karma 
    @bonus=0
    @search = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).search(params[:search])
    @mydeals=current_user.deals.includes(:stores,:comments,:user)
      unless @mydeals.empty?
       @bonus=@mydeals.count * 5
       end
  @deal=@city.deals.build(params[:deal])
   if @deal.save
    redirect_to @deal
     flash[:notice]="CONGRATULATION! You have earned +5 points. Thank you for sharing the deal with us"
    else
    render 'new' 
    flash[:error]="Error occured, your deal was not saved"
    end 
  end

  def retailer_create
    @cities=City.find(:all)
    @total_comments=0
      @bonus=0
     @mydeals=current_user.deals.includes(:stores,:comments,:user)
        @points=current_user.karma 
      unless @mydeals.empty?
       @bonus=@mydeals.count * 5
       end
     @mydeals.each do |mydeal|
      @comments=mydeal.comments
     @last_signed=current_user.last_sign_in_at
     @old_comments=@comments.where("created_at < ?",@last_signed).count
     @new_comments=@comments.count-@old_comments
     @total_comments+=@new_comments
        
     end
  @search = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).search(params[:search])  
  @city = City.find(session[:city_id])
  @deal=@city.deals.build(params[:deal])
   if @deal.save
    redirect_to :controller=>"deal" ,:action=>"profile"
     flash[:notice]="Thank you for choosing spotsaving, your Deal has been posted"
    else
    render 'retailers' 
    flash[:error]="Error occured,data was not saved"
      
  end 
  end
  
  
  def ask_create
  @cities=City.find(:all)
  @search = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).search(params[:search])  
   @total_comments=0
     @bonus=0
     @mydeals=current_user.deals.includes(:stores,:comments,:user)
     @points=current_user.karma 
      unless @mydeals.empty?
       @bonus=@mydeals.count * 5
       end
    @city = City.find(session[:city_id])
    @deal=@city.deals.build(params[:deal])
    #@deal=Deal.new(params[:deal])
   if @deal.save
    redirect_to @deal
     flash[:notice]="Your question has been submitted"
    else
    render 'ask' 
    flash[:error]="Error occured,data was not saved"
   end   
  end

  def show
    @cities=City.find(:all)
    unless session[:city_id].nil? || session[:city_id].blank?
     @city = City.find_by_id(session[:city_id])
     @deals=Deal.where("city_id = ?", session[:city_id]).includes( :stores)
     @store=StoreDeal.where("deal_id = ?",@deal).includes(:store)
     @search = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).search(params[:search])
     @total_comments=0
     @bonus=0
     if user_signed_in?
     @mydeals=current_user.deals.includes(:stores,:comments,:user)
        @points=current_user.karma 
      unless @mydeals.empty?
       @bonus=@mydeals.count * 5
       end
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
     @bonus=0
     if user_signed_in?
     @mydeals=current_user.deals.includes(:stores,:comments,:user)
       @points=current_user.karma 
      unless @mydeals.empty?
       @bonus=@mydeals.count * 5
       end
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
    @cities=City.find(:all)
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
    @bonus=0
     if user_signed_in?
     @mydeals=current_user.deals.includes(:stores,:comments,:user)
       @points=current_user.karma 
      unless @mydeals.empty?
       @bonus=@mydeals.count * 5
       end
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
     @bonus=0
     if user_signed_in?
     @mydeals=current_user.deals.includes(:stores,:comments,:user)
        @points=current_user.karma 
      unless @mydeals.empty?
       @bonus=@mydeals.count * 5
       end
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
  @questions=Question.where("city_id = ?", session[:city_id]).includes(:user,:answers).order("created_at DESC") 
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
   @cities=City.find(:all)
   @total_comments=0
   @bonus=0
     if user_signed_in?
     @mydeals=current_user.deals.includes(:stores,:comments,:user)
       @points=current_user.karma 
      unless @mydeals.empty?
       @bonus=@mydeals.count * 5
       end
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
    unless current_user.business
      flash.now[:error]="You need business account to access this page.Please Register for free"
    end
    @cities=City.find(:all)
    @deal=Deal.new 
     unless session[:city_id].nil? || session[:city_id].blank?
      @city = City.find(session[:city_id])
    end
    @search = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).search(params[:search])
     @deal = @city.deals.build
    @deal.stores.build
 
     #comment alert
     @total_comments=0
     @bonus=0
     if user_signed_in?
     @mydeals=current_user.deals.includes(:stores,:comments,:user)
        @points=current_user.karma 
      unless @mydeals.empty?
       @bonus=@mydeals.count * 5
       end
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
    @cities=City.find(:all)
    @city = City.find(session[:city_id])
     @search = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).search(params[:search])
    @deals = @search.all
   #comment alert
     @total_comments=0
     @bonus=0
     if user_signed_in?
     @mydeals=current_user.deals.includes(:stores,:comments,:user)
     @points=current_user.karma 
      unless @mydeals.empty?
       @bonus=@mydeals.count * 5
       end
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
    @cities=City.find(:all)
      @city = City.find(session[:city_id])
      @search = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).search(params[:search])
      @total_comments=0
      @bonus=0
       @points=0
  if user_signed_in?
    @questions=current_user.questions.includes(:answers)
    @answers=current_user.answers.includes(:question)
     @mydeals=current_user.deals.includes(:stores,:comments,:user)
       unless @mydeals.empty?
       @bonus=@mydeals.count * 5
       end
     @mydeals.each do |mydeal|
      @comments=mydeal.comments
     @last_signed=current_user.last_sign_in_at
     @old_comments=@comments.where("created_at < ?",@last_signed).count
     @new_comments=@comments.count- @old_comments
     unless current_user.karma.nil?
     @points=current_user.karma
   end
     @total_comments+=@new_comments
      @credits=0 
     unless mydeal.votes.empty?
        
      if @points + @bonus < 5
         @credits=0
         @last_vote=mydeal.votes.find(:last).created_at
      elsif @points  + @bonus == 5
          @credits=0.01 
          @last_vote=mydeal.votes.find(:last).created_at
          flash[:notice]="CONGRATULATION! You have earned +5 points."  
      else
        @new_votes=mydeal.plusminus - mydeal.votes.where("created_at < ?", @last_vote).count
        @credits=0.01 
        if @new_votes  == 5
        @credits+=@points + @bonus * 0.002
        @last_vote=mydeal.votes.find(:last).created_at
        flash[:notice]="CONGRATULATION! You have been credited a penny."  
        end  
                   
       end 
    else
    @credits+= @bonus * 0.002          
    end  
           end 
else
redirect_to :controller=>"deal",:action=>"show"  
flash.now[:error]="You need business account to access this page.Please Register for free"                   
end 
  
end

def how_it_works
  @cities=City.find(:all)
  @city = City.find(session[:city_id])
      @search = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).search(params[:search])
      @total_comments=0
      @bonus=0
     if user_signed_in?
     @mydeals=current_user.deals.includes(:stores,:comments,:user)
       @points=current_user.karma 
      unless @mydeals.empty?
       @bonus=@mydeals.count * 5
       end
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
  @cities=City.find(:all)
    @city = City.find(session[:city_id])
     @search = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).search(params[:search])
      @total_comments=0
      @bonus=0
     if user_signed_in?
     @mydeals=current_user.deals.includes(:stores,:comments,:user)
        @points=current_user.karma 
      unless @mydeals.empty?
       @bonus=@mydeals.count * 5
       end
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
  @cities=City.find(:all)
    @city = City.find(session[:city_id])
     @search = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).search(params[:search])
      @total_comments=0
      @bonus=0
     if user_signed_in?
     @mydeals=current_user.deals.includes(:stores,:comments,:user)
        @points=current_user.karma 
      unless @mydeals.empty?
       @bonus=@mydeals.count * 5
       end
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

def ask
 @deal=Deal.new 
 @city = City.find(session[:city_id])
 @deal = @city.deals.build
 @cities=City.find(:all)
 @search = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).search(params[:search])
  @total_comments=0
     @bonus=0
     if user_signed_in?
     @mydeals=current_user.deals.includes(:stores,:comments,:user)
        @points=current_user.karma 
      unless @mydeals.empty?
       @bonus=@mydeals.count * 5
       end
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
