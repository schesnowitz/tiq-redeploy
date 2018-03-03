json.extract! parse_user, :id, :email, :password, :username, :created_at, :updated_at
json.url parse_user_url(parse_user, format: :json)
