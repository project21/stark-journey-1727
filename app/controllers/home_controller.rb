class HomeController < ApplicationController
   
  def index
   # @city=City.find(params[:cities][:city_id]) 
  end

  def next
   @city=City.find_by_id(params[:city][:city_id]) 
   unless @city.blank? 
   session[:city_id] = @city.id
   redirect_to show_deals_path
 else
  redirect_to :controller=>"home" ,:action=>"index" 
end
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
