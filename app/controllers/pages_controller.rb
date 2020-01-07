class PagesController < ApplicationController
  def index
    @places = Place.ordered.limit(8)
  	@services = Service.ordered.limit(8)
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
