class PlacesController < ApplicationController
  layout 'places'
  
  before_action :authenticate_user!, :get_places 
  before_action :set_place, only: [:edit, :update, :destroy]
  before_action :get_services, only: %i[index new create edit update destroy]
  before_action :set_item, :authenticate_admin!, only: %i[edit update destroy]
  
  # GET /places
  # GET /places.json
  def index
    @places = @most_famous_places
  end

  # GET /places/1
  # GET /places/1.json
  def show
    @place = Place.find(params[:id])
    get_services
    @comments = @place.comment_threads
  end

  # GET /places/new
  def new
    @places = current_user.places
    @new_place = current_user.places.new
  end

  # GET /places/1/edit
  def edit
    @places = current_user.places
    respond_to do |format|
      format.html
      format.js
    end
  end

  # POST /places
  # POST /places.json
  def create
    @places = current_user.places
    @place = current_user.places.new(place_params)
    @place.user = current_user
    
    respond_to do |format|
      if @place.save
        format.html { redirect_to @place, success: 'Place was successfully created.' }
        format.json { render :show, status: :created, location: @place }
      else
        format.html { render :new }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /places/1
  # PATCH/PUT /places/1.json
  def update
    respond_to do |format|
      if @place.update(place_params)
        format.html { redirect_to @place, success: 'Place was successfully updated.' }
        format.json { render :show, status: :ok, location: @place }
      else
        format.html { render :edit }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /places/1
  # DELETE /places/1.json
  def destroy
    @place.destroy
    respond_to do |format|
      format.html { redirect_to places_url, success: 'Place was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def go_to
    @place = Place.find(params[:place_id])
    get_services
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.find(params[:id])
    end

    def set_item
      @item = set_place
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def place_params
      params.require(:place).permit(:user_id, :category_id, :title, :location, :longitude, :latitude, :description, :main, :tag_list)
    end
end
