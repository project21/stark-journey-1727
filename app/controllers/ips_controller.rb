class IpsController < ApplicationController
  def index

  	@email=Ip.new 
  	 if user_signed_in?
    redirect_to :controller=>"deal" ,:action=>"show"
 else   
   unless session[:city_id].nil? || session[:city_id].blank? 
    redirect_to :controller=>"deal" ,:action=>"show"
   else
   	#redirect_to :controller=>"home" ,:action=>"index"
   end
  end 
  end

  def create
  	@email=Ip.new(params[:ip]) 
  	if @email.save
  		redirect_to :controller=>"home" ,:action=>"index"
  	else
  		render 'index'
  	  end 	
  end

end
