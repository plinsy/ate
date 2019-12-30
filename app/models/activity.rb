class Activity < ApplicationRecord
	has_many :places
	has_many :categories, dependent: :destroy
end
