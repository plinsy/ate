class Place < ApplicationRecord
  belongs_to :user
  belongs_to :activity

  has_one_attached :banner_image
end
