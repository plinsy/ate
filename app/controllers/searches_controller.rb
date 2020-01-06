class SearchesController < ApplicationController
	before_action :authenticate_user!

  def index
    if !params[:search].nil?
      @keyword = params[:search][:keyword]
      @type = params[:search][:type]
      @category = params[:search][:category]

      if @type == "service"
        @class = Service
      elsif @type == "profile"
        @class = Profile
      end
    end

    @class ||= Place
    @keyword ||= "*"

    @class.reindex

    @search = @class.search(@keyword, per_page: 12)
    @pagy = Pagy.new_from_searchkick(@search)

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
end
