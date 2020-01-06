class Service < ApplicationRecord
	include PublicActivity::Model
  tracked
  
  belongs_to :place

 	acts_as_taggable 
  acts_as_taggable_on :categories

  mount_uploader :image, ImageUploader

  acts_as_votable
end
