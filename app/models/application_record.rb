class ApplicationRecord < ActiveRecord::Base
  scope :ordered, -> { order("created_at DESC") }

  self.abstract_class = true

  def reviews
  	r = []
  	self.comment_threads.each do |comment|
  		r += comment.get_upvotes(vote_scope: "review")
  	end
  	return r
  end

  def is?(obj)
  	self.class == obj
  end
end
