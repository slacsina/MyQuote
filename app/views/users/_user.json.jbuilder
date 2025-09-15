json.extract! user, :id, :fname, :surname, :email, :password_digest, :is_admin, :status, :created_at, :updated_at
json.url user_url(user, format: :json)
