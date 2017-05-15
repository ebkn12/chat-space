class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage Rails.env == 'test' ? :file : :fog

  process resize_to_limit: [300, 200]

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end

