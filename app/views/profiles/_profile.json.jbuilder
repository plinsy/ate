json.extract! profile, :id, :user_id, :firstname, :lastname, :gender, :phone, :created_at, :updated_at
json.url profile_url(profile, format: :json)
