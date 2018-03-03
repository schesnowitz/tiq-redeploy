json.extract! mobile_user, :id, :email, :username, :password, :mobile_user_id, :type, :created_at, :updated_at
json.url mobile_user_url(mobile_user, format: :json)
