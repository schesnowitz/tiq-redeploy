json.extract! load_document, :id, :file, :note, :load_id, :created_at, :updated_at
json.url load_document_url(load_document, format: :json)