class ViewController < ApplicationController
	layout "header"
  def show
  	@city = City.find(session[:city_id])
  	 @deal=Deal.find(params[:deal_id])
  	# @comments=@deal.comments
  #	@viewdeals=@city.deals
  #	@viewdeals=Deal.where("city_id=? AND deal_id=?",session[:city_id],params[:deal_id]).includes(:stores)
  #	@viewdeals=@city.deals.last
  #	@viewdeal=@viewdeals.find_by_item_name(params[:item_name])
  #	@viewdeal=@viewdeals.find(params[:id])
 #  @deal=Deal.find(1)
 #  @comment=@deal.comments
  end

end
