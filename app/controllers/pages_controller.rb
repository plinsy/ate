class PagesController < ApplicationController
  def index
  	@places = Place.ordered
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
