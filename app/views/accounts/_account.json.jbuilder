json.extract! account, :id, :user_id, :level, :price, :deadline, :expired, :created_at, :updated_at
json.url account_url(account, format: :json)
