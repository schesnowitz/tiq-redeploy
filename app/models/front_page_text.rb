class FrontPageText < ApplicationRecord
  belongs_to :front_page
  mount_uploader :image_input, FrontPagesImageUploader
end
   