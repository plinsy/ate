class Service < ApplicationRecord
	include PublicActivity::Model
  tracked
  
  belongs_to :place

 	acts_as_taggable 
  acts_as_taggable_on :categories

  mount_uploader :image, ImageUploader

  acts_as_votable

  searchable do
    text :title, :description
    float :price
    time :created_at

    string :place_title do
      place.title.downcase
    end
  end
end
