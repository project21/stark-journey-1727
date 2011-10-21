class HomeController < ApplicationController
  def index
   # @city=City.find(params[:cities][:city_id]) 
  end

  def next
   @city=City.find(params[:cities][:city_id]) 
   session[:city_id] = @city.id
   redirect_to :controller=>"deal",:action =>"show" 
  end  

  def new
    @city=City.new
  end

  def search
  end

  def cities
  end

  def retailers
  end

  def new_deals
  end

  def q
  end

end
