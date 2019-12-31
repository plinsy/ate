class CommentsController < ApplicationController
	before_action :authenticate_user!

  def index
  end

  def create
    @user_who_commented = current_user
    @place = Place.find(params[:comment][:commentable_id])
    if @comment = Comment.build_from(@place, @user_who_commented.id,"",params[:comment][:pos_body],params[:comment][:neg_body] )
      @comment.vote_by voter: @user_who_commented, vote_scope: "review", vote_weight: params[:comment][:vote_weight]
    end
  	respond_to do |format|
  		format.js
  	end
  end

  def update
  	respond_to do |format|
  		format.js
  	end
  end
end
