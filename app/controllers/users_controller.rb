class UsersController < ApplicationController
	layout 'users'
	
	before_action :authenticate_user

  def profile
  end
end
