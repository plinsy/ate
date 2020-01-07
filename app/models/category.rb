class Category < ApplicationRecord
  acts_as_taggable # Alias for acts_as_taggable_on :tags
  has_many :places
end
