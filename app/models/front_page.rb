class FrontPage < ApplicationRecord
  has_many :front_page_texts 
  # accepts_nested_attributes_for :front_page_texts 
end
