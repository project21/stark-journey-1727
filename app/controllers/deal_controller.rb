class DealController < ApplicationController
  before_filter :authenticate_user!, :only=>:new
  layout "header"
  def index
    
  end

  def create
  @city = City.find(session[:city_id])
  @deal=@city.deals.build(params[:deal])
   if @deal.save
    redirect_to @deal
     flash[:notice]="successfully created"
    else
    render 'new' 
   
  end 
  end

  def show
    unless session[:city_id].nil? || session[:city_id].blank?
     @city = City.find(session[:city_id])
    # @deals=@city.deals
   #   @onedeal=@deals.first
    # @deal=@deals.find(params[:id])
   #   @stores = @deal.collect(&:stores)

    #  @onestore=@deal.find(params[:id])
     # @store=@onestore.stores.first(params[:store_id])
  #   @onedeal=@deals.find_with_ids(1) 
  # @store=@onedeal.store_deals.collect
    #  @store=@onedeal.stores.first(params[:store_id])
      
     #@showdeal=@onedeal.first(params[:deal_id])
      #@category=Category.find(:all)
   #   @ms=Deal.find(3)
    #  @m=@ms.vote_for
    # @m=@deal.votes
   # end
    @store_deals=StoreDeal.where("stores.city_id = ?", session[:city_id]).includes(:deal, :store)
     @search = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).search(params[:search])
    
   
   end
end 

def vote_up
    @items=Deal.find(3)
    current_user.vote_for(@items)
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
      @deals=@city.deals
    end
  @search = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).search(params[:search])

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
