class CommentsController < ApplicationController
 #before_filter :authenticate_user!, :only=>:create
  layout "header"
  respond_to :js
  # GET /comments
  # GET /comments.json
  def index
   @city = City.find(session[:city_id])
   @deal=Deal.find(params[:deal_id])
   @comments = @deal.comments.includes(:user)
   @search = Deal.where(" city_id=?",session[:city_id]).includes(:stores,:comments).search(params[:search])
  # @store=StoreDeal.find(@deal.id)
  current_user.update_attribute(:last_sign_in_at,Time.now)
  end

 

  # GET /comments/1
  # GET /comments/1.json
  def show
  # @comment = Comment.find(params[:id])
   #@deal=Deal.find(params[:deal_id])
   @comment=Comment.all
 #  @deal=Deal.find(params[:deal_id])
  # @comment=@deal.comments

   
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    @comment = Comment.new
    @deal=Deal.find(params[:deal_id])
    @comment=@deal.comments.build
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
    #owner of the deal should be able to edit his own deal
  end

  # POST /comments
  # POST /comments.json
  def create
    @deal=Deal.find(params[:comment][:deal_id])
    @comment = @deal.comments.build(params[:comment])
   # @comment = Comment.create(params[:comment])
    if  @comment.save 
       #respond_with( @comment, :layout => !request.xhr? )
       #flash.now[:error] = "Please sign up before posti"
     else
      flash.now[:error] = "Please write the comment before submitting" 
     #respond_with( @comment, :layout => !request.xhr? )
     render "index"
     end 
        
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
 #   @comment = Comment.find(params[:id])
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

  end
end
