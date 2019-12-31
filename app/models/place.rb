class Place < ApplicationRecord
	scope :ordered, -> { order("created_at DESC") }

  belongs_to :user
  has_many :services

  acts_as_taggable # Alias for acts_as_taggable_on :tags
  acts_as_taggable_on :activities

  mount_uploader :image, ImageUploader

  acts_as_votable
end
