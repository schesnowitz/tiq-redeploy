json.extract! truck, :id, :year, :make, :model, :color, :number, :vin, :image, :notes, :driver_user_id, :hrc_user_id, :created_at, :updated_at
json.url truck_url(truck, format: :json)