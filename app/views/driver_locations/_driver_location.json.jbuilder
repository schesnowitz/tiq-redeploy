json.extract! driver_location, :id, :driver_email, :parse_id, :latitude, :longitude, :speed, :bearing, :parse_created_at, :parse_updated_at, :driver_user_id, :created_at, :updated_at
json.url driver_location_url(driver_location, format: :json)
