class AnswersController < ApplicationController
  before_filter :authenticate_user!, :only=>:create
  respond_to :js
  def create
  unless session[:city_id].nil? || session[:city_id].blank?
  	@question=Question.find(session[:question_id])
  	@answer=Answer.new(params[:answer])
  	if @answer.save
  		redirect_to @question
    else
     redirect_to  @question
    end
   else 
   redirect_to  @question
   end	
  end

  def new
  	@answer=Answer.new
  end

  def vote_up1
    @answer=Answer.find(params[:id])
    if user_signed_in?
    unless current_user.voted_for?(@answer) || current_user.voted_against?(@answer) 
    current_user.vote_for(@answer)
    flash.now[:notice]="Thank you for voting"
    else
    flash.now[:error]="Sorry you already voted for this deal"
    respond_with(@answer,:layout => !request.xhr?)
  end  
else
 flash.now[:error]="You have to login or sign up to vote for this deal "
end
end 

def vote_down1
    @answer=Answer.find(params[:id])
    if user_signed_in?
    unless current_user.voted_for?(@answer) || current_user.voted_against?(@answer) 
    current_user.vote_against(@answer)
    flash.now[:notice]="Thank you for voting"
    else
    flash.now[:error]="Sorry you already voted for this deal"
    respond_with(@answer,:layout => !request.xhr?)
  end  
else
 flash.now[:error]="You have to login or sign up to vote for this deal "
end
end 

def show
 @answer=Answer.find(17) 
  
end

end
