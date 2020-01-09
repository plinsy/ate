class SearchesController < ApplicationController
	before_action :authenticate_user!, :reindex_all

  def index
    @q = params[:q]
    @type = params[:type]
    @tag = params[:tag]

    if @type == "service"
      @class = Service
    elsif @type == "profile"
      @class = Profile
    end

    @class ||= Place
    @q ||= "*"
    @tag ||= "*"

    if @q != "*" && @tag != "*" || @q == "*" && @tag == "*"
      @search = @class.search([@q, @tag], fields: [:title, :location, :name_tagged], suggest: true, per_page: 12)
    elsif @q != "*" && @tag == "*"
      @search = @class.search(@q, fields: [:title, :location], suggest: true, per_page: 12)
    elsif @q == "*" && @tag != "*"
      @search = @class.search(@tag, fields: [:name_tagged], suggest: true, per_page: 12)
    end
    
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
    params.permit(:q, :type, :tag)
  end
end
