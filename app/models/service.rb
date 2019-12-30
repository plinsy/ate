class Service < ApplicationRecord
  belongs_to :place
  belongs_to :category

  has_one_attached :image
end
