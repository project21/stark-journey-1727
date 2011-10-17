class CommentsController < ApplicationController
  respond_to  :js
  # GET /comments
  # GET /comments.json
  def index
   # @comments = Comment.all

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
    @deal=Deal.find(params[:id])
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
    @deal=Deal.find(params[:id])
    @comment = @deal.comments.build(params[:comment])
   # @comment = Comment.create(params[:comment])
       @comment.save
       respond_with( @comment, :layout => !request.xhr? )
           
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
