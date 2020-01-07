class SearchesController < ApplicationController
	before_action :authenticate_user!, :reindex_all

  def index
    if !params[:search].nil?
      @keyword = params[:search][:keyword]
      @type = params[:search][:type]
      @tag = params[:search][:tag]

      if @type == "service"
        @class = Service
      elsif @type == "profile"
        @class = Profile
      end
    end

    @class ||= Place

    case @keyword
    when nil || "" || " "
      @keyword = "*"
    end

    case @tag
    when nil || "" || " "
      @tag = "*"
    end

    @search = @class.search([@keyword, @tag], fields: [:title, :location, :name_tagged], suggest: true, per_page: 12)
    
    if params[:page].nil?
      @pagy = Pagy.new_from_searchkick(@search, params: search_params)
    else
      @pagy = Pagy.new_from_searchkick(@search, params: search_params, page: params[:page])
    end

    @item = @search.first
    
    respond_to do |format|
      format.html{ render :index }
      format.js
    end
  end

  def new
  end

  def create
  	# add_activity(@item, "searches.for.#{@item.class.downcase.underscore}")
  end

  protected
  def search_params
    params[:search].nil? ? {} : params.require(:search).permit(:keyword, :type, :tag)
  end
end
