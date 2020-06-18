json.extract! user, :id, :name, :gravatar_url, :created_at, :updated_at
json.url user_url(user, format: :json)
