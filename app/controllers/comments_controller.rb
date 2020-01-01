class CommentsController < ApplicationController
	before_action :authenticate_user!

  def index
  end

  def create
    @user_who_commented = current_user
    @place = Place.find(params[:comment][:commentable_id])
    @comment = Comment.build_from(@place, @user_who_commented.id,"#{params[:comment][:pos_body]} #{params[:comment][:neg_body]}",params[:comment][:pos_body],params[:comment][:neg_body] )
    if @comment.save
      @comment.vote_by voter: @user_who_commented, vote_scope: "review", vote_weight: params[:comment][:vote_weight]
      reload(@place, @comment, @place.comment_threads.length, "review", "comments-list", "comment-form", Comment.new(commentable: @place, user: current_user, body: "No comment"))
    end
  end

  def update
  	respond_to do |format|
  		format.js
  	end
  end
end
