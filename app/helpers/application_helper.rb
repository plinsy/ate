module ApplicationHelper
	def authenticate_user
		if authenticate_user!
			@user = current_user
		end
	end

	def set_page_id
    @page_id = params[:page_id]
	end
end
