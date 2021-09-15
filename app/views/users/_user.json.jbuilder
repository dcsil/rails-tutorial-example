json.extract! user, :id, :name, :email, :preferred_pronouns, :bio, :created_at, :updated_at
json.url user_url(user, format: :json)
