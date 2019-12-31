class VotesController < ApplicationController
	before_action :authenticate_user!, :set_item

  def create
    @item.vote_by voter: current_user, vote_scope: @vote_type
  	respond_to do |format|
  		format.js
  	end
  end

  def destroy
    @item.dislike_by current_user, vote_scope: @vote_type
  	respond_to do |format|
  		format.js
  	end
  end

  protected
    def set_item
      @vote_type = params[:vote_type]
      @short = params[:short]
      @item_type = params[:item_type]
      @first_content = params[:first_content]
      @second_content = params[:second_content]
      @vote_weight = params[:vote_weight]
      @color = params[:color]
      if @item_type == "place"
        @item = Place.find(params[:item_id])
      elsif @item_type == "service"
        @item = Service.find(params[:item_id])
      end
    end
end
