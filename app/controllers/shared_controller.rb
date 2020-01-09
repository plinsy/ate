class SharedController < ApplicationController
	
	def tag_list
		@class = params[:item_type]=='service' ? Service : Place
		@item = @class.find(params[:item_id])
		@category = Category.find(params[:category_id])
		@tags = @category.tag_list
		respond_to do |format|
			format.js
		end
	end
end
