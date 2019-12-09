json.extract! place, :id, :user_id, :activity_id, :title, :location, :longitude, :latitude, :description, :main, :created_at, :updated_at
json.url place_url(place, format: :json)
