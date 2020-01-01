class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def reviews
  	r = []
  	self.comment_threads.each do |comment|
  		r += comment.get_upvotes(vote_scope: "review")
  	end
  	return r
  end
end
