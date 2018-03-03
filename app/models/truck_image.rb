class TruckImage < ApplicationRecord
  belongs_to :truck
  mount_uploader :image_file, TruckImageUploader 
end