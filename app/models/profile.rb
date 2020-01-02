class Profile < ApplicationRecord
	include PublicActivity::Model
  tracked
  
  belongs_to :user
  
  mount_uploader :avatar, ImageUploader
end
