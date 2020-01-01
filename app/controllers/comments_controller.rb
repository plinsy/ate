class CommentsController < ApplicationController
	before_action :authenticate_user!

  def index
  end

  def create
    @user = current_user
    @place = Place.find(params[:comment][:commentable_id])
    @comment = Comment.build_from(@place, @user.id,"#{params[:comment][:pos_body]} #{params[:comment][:neg_body]}",params[:comment][:pos_body],params[:comment][:neg_body] )
    if !current_user.commented?(@place) && @comment.save
      @comment.vote_by voter: @user, vote_scope: "review", vote_weight: params[:comment][:vote_weight]
      reload(@place, @comment, @place.comment_threads.length, "review", "comments-list", "comment-form", Comment.new(commentable: @place, user: current_user, body: "No comment"))
    elsif current_user.commented?(@place)
      @comment = @place.comment_threads.where(user_id: current_user.id).last
      @comment.vote_by voter: @user, vote_scope: "review", vote_weight: params[:comment][:vote_weight]
    else
    end
  end

  def update
  	respond_to do |format|
  		format.js
  	end
  end
end
