class FeedbacksController < ApplicationController
	layout "header"
  def new
  	@search = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).search(params[:search])  
    @city = City.find(session[:city_id])
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
  	@feedback=Feedback.new
  end

  def create
  	@feedback=Feedback.new(params[:feedback])
  	if @feedback.save
  	   flash[:notice]="Thank you for your suggestions/advice. We will look into it"
       redirect_to :controller=>"deal" ,:action=>"show"
  	else
  	render 'new'
  	end	
  end

end
