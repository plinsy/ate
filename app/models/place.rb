class Place < ApplicationRecord

  acts_as_taggable # Alias for acts_as_taggable_on :tags

  belongs_to :category
  
  scope :search_import, -> { includes(:tags) }

  def search_data
    { name_tagged: "#{title} #{tags.map(&:name).join(" ")}" }
  end

  def activity
    self.category.name
  end

  belongs_to :user
  has_many :services


  mount_uploader :image, ImageUploader

  acts_as_votable

  acts_as_commentable
	
  include PublicActivity::Model
  tracked

  searchkick word_start: [:title, :location], suggest: [:title, :location, :name_tagged]
end
