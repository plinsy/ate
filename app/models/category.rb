class Category < ApplicationRecord
  belongs_to :activity
  has_many :services
end
