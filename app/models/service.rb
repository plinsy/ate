class Service < ApplicationRecord

 	acts_as_taggable 
  acts_as_taggable_on :categories

	scope :search_import, -> { includes(:tags) }

  def search_data
    {
      name_tagged: "#{title} #{tags.map(&:name).join(" ")}"
    }
  end

	include PublicActivity::Model
  tracked
  
  belongs_to :place

  mount_uploader :image, ImageUploader

  acts_as_votable

  searchkick word_start: [:title, :price], suggest: [:title, :price]
end
