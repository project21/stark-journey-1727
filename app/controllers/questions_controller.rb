class QuestionsController < ApplicationController
  before_filter :authenticate_user!, :only=>:create
layout "header"
  def index
     #@answer=Answer.new
    @questions=Question.where("city_id = ?", session[:city_id]).includes(:user,:answers)
  	@cities=City.find(:all)
   @city = City.find(session[:city_id])
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

  def new
  	@question=Question.new
  	@cities=City.find(:all)
   @city = City.find(session[:city_id])
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

  def create
    @city = City.find(session[:city_id])
     @search = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).search(params[:search])
     @cities=City.find(:all)
     @points=current_user.karma 
   @bonus=0
  	@question=Question.new(params[:question])
  	if @question.save
  		redirect_to @question
  	else
  	 render 'new'	
  	end
  end

  def show
   @answer=Answer.new
   @city = City.find(session[:city_id])
   @question=Question.find(params[:id]) 
   @answers= @question.answers.includes(:user)
   session[:question_id] = @question.id
     @cities=City.find(:all)
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

end
