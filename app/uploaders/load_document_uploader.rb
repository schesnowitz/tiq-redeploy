class LoadDocumentUploader < CarrierWave::Uploader::Base


  include CarrierWave::MiniMagick
  process :quality => 100
  storage :file



  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process resize_to_fit: [740, 958] 
  process :quality => 100
  version :thumb do
    process resize_to_fill: [100,150]
  end 

  def extension_whitelist
    %w(jpg jpeg gif png pdf)  
  end

  def save_content_type_and_size_in_model
    model.content_type = file.content_type if file.content_type
    model.file_size = file.size
  end
end
