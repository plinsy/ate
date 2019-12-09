module ApplicationHelper
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
end
