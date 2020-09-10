class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  if Rails.env.production?
    storage :fog
  else
    storage :file
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
  
  version :thumb do 
    process resize_to_fill: [200, 200, "Center"]
  end
  version :thumb50 do
    process resize_to_fill: [100, 100]
  end
end
