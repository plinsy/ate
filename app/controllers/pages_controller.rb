class PagesController < ApplicationController
  def index
    @places = Place.ordered.limit(8)
  	@services = Service.ordered.limit(8)
    @events = Service.select { |service| service.place.category.name.downcase=="event" }
    @most_famous_places = Place.ordered.limit(4)
    @first = @most_famous_places.first
    @second = @most_famous_places.second
    @third = @most_famous_places.third
    @fourth = @most_famous_places.fourth
  end
  def pricing
  end
  def terms_conditions
  end
  def contact
  end
  def faq
  end
end
