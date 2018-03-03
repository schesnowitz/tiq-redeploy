class LoadDocument < ApplicationRecord
  belongs_to :load 
  validates :doc_file, :file_type, presence: true 
  mount_uploader :doc_file, LoadDocumentUploader 


end
