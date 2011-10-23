class DealController < ApplicationController
  respond_to :js
  before_filter :authenticate_user!, :only=>:new
  layout "header"
  def index
    
  end

  def create
   @search = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).search(params[:search])  
  @city = City.find(session[:city_id])
  @deal=@city.deals.build(params[:deal])
   if @deal.save
    redirect_to @deal
     flash[:notice]="Thank you for sharing the deal with us"
    else
    render 'new' 
    flash[:error]="Error occured,the deal was not saved"
  end 
  end

  def show
   
    unless session[:city_id].nil? || session[:city_id].blank?
     @city = City.find(session[:city_id])
   
    @store_deals=StoreDeal.where("stores.city_id = ?", session[:city_id]).includes(:deal, :store)
     @search = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).search(params[:search])
   end
 
end 

def vote_up
    @city = City.find(session[:city_id])
     @store_deals=StoreDeal.where("stores.city_id = ?", session[:city_id]).includes(:deal, :store)
     @search = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).search(params[:search])
     @items=Deal.find(params[:id])
  unless current_user.voted_for?(@items) || current_user.voted_against?(@items) 
    current_user.vote_for(@items)
    flash.now[:notice]="Thank you for voting"
  else
    flash.now[:error]="Sorry you already voted for this deal"
    respond_with(@items,:layout => !request.xhr?)
   
  end 
   # render :nothing => true, :status => 200
 # rescue ActiveRecord::RecordInvalid
  #  render :nothing => true, :status => 404
  
 #   end
 end 

 def vote_down
     @city = City.find(session[:city_id])
     @store_deals=StoreDeal.where("stores.city_id = ?", session[:city_id]).includes(:deal, :store)
     @search = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).search(params[:search])
     @items=Deal.find(params[:id])
    unless current_user.voted_for?(@items) || current_user.voted_against?(@items)
    current_user.vote_against(@items)
    flash.now[:notice]="Thank you for voting"
    respond_with(@items,:layout => !request.xhr?)
    else
    flash.now[:error]="Sorry you already voted for this deal"
    respond_with(@items,:layout => !request.xhr?)
   
  end 
#   render :nothing => true, :status => 200
#  rescue ActiveRecord::RecordInvalid
 #   render :nothing => true, :status => 404
  
 #   end
 end 
  
  def update
    
   
  end 

  def new
   @deal=Deal.new 
   @city = City.find(session[:city_id])
   @deal = @city.deals.build
   @deal.stores.build
   
   @deal.build_category
   #mention time (how long the deal is going to be till)
   @search = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).search(params[:search])

  end

  def all_cities
   @cities=City.find(:all)
    unless session[:city_id].nil? || session[:city_id].blank?
      @city = City.find(session[:city_id])
    end
  #@city=City.find(params[:city_id]) 
 # session[:city_id] = @city.id
 @search = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).search(params[:search])

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
  @deals = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).order("created_at DESC")
  end

  def retailers
     unless session[:city_id].nil? || session[:city_id].blank?
      @city = City.find(session[:city_id])
    end
    @search = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).search(params[:search])

  end

  def search
    @city = City.find(session[:city_id])
     @search = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).search(params[:search])
    @deals = @search.all
   
  end

  def questions
  end

end
