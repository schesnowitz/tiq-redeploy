class TrailerImage < ApplicationRecord
  belongs_to :trailer
  mount_uploader :image_file, TrailerImageUploader 
end