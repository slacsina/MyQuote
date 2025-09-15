json.extract! author, :id, :auth_fname, :auth_surname, :birthyear, :deathyear, :biography, :created_at, :updated_at
json.url author_url(author, format: :json)
