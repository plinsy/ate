module ApplicationHelper
	include Pagy::Frontend
	
	def authenticate_user
		if authenticate_user!
			@user = current_user
		end
	end

	def authenticate_admin
		authenticate_user
		unless current_user.is_admin?
			redirect_to "/404.html"
		end
	end

	def set_page_id
    session[:page_id] = params[:page_id]
    session[:page_id] ||= 'page-content'
    @page_id = session[:page_id]
	end

	def page_need_google_map?
		if (controller_name=="pages" && action_name=="index") || (controller_name=="pages" && action_name=="show")
			return true
		else
			return false
		end
	end

	def get_place
		@place = Place.find(params[:place_id])
	end

	def get_services
		@place ||= current_user.places.first
		@services = @place.services
		return @services
	end

	def activities
		["Personal activity",
		"Hospital",
		"School",
		"Bus stop",
		"Hotel",
		"Restaurant",
		"Coffee",
		"Cyber",
		"Pub",
		"Airport"]
	end

	def categories
		activities
	end

	def reload(parent, item, votes_length, vote_type, item_list, div_form_id, new_item)
		@parent = parent
		@item = item
		@votes_length = votes_length
		@vote_type = vote_type
		@item_list = item_list
		@div_form_id = div_form_id
		@new_item = new_item
		respond_to do |format|
			format.js{ render partial: 'shared/reload' }
		end
	end

	def add_activity(obj, key)
    obj.create_activity key: key, owner: obj.user
  end

  def reindex_all
  	Place.reindex
  	Service.reindex
  	# Profile.reindex
  end
end
