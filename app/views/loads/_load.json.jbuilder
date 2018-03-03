json.extract! load, :id, :commodity, :weight, :units, :load_size, :rate, :distance, :pick_up_time, :delevery_time, :equipment_type, :created_at, :updated_at
json.url load_url(load, format: :json)