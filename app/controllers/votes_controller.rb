class VotesController < ApplicationController
	before_action :authenticate_user!

  def new
  end

  def create
    @item_type = params[:item_type]
  	if @item_type == "place"
	  	@item = Place.find(params[:item_id])
  	end
	  @item.liked_by current_user
  	respond_to do |format|
  		format.js
  	end
  end

  def destroy
    @item_type = params[:item_type]
  	if @item_type == "place"
	  	@item = Place.find(params[:item_id])
  	end
	  @item.disliked_by current_user
  	respond_to do |format|
  		format.js
  	end
  end
end
