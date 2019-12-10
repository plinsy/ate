class ApplicationController < ActionController::Base
	add_flash_types :success, :info, :warning, :danger

	include ApplicationHelper
	before_action :set_page_id
end
