class Profile < ApplicationRecord
	after_create :complete_user
	after_update :upgrade_rank

	include PublicActivity::Model
  tracked
  
  belongs_to :user
  
  mount_uploader :avatar, ImageUploader

  def complete_user
    self.user.add_badge(1)
  end

  def upgrade_rank
  	self.user.add_badge(2) if self.firstname != "" && self.lastname != "" &&  self.phone != ""
  end
end
