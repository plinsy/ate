class SearchesController < ApplicationController
	before_action :authenticate_user!

  def index
  end

  def new
  end

  def create
  	@keyword = params[:search][:keyword]
    @type = params[:search][:type]
    @category = params[:search][:category]

    if @type == "service"
      @class = Service
    elsif @type == "profile"
      @class = Profile
    end

    @class ||= Place

  	@search = @class.search do
  		fulltext @keyword
  	end 
  	@item = @search.first
  	respond_to do |format|
  		format.html
  		format.js
  	end
  	add_activity(@item, "searches.for.#{@item.class.downcase.underscore}")
  end
end
