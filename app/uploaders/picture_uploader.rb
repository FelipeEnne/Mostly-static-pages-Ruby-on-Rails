class PictureUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  process resize_to_limit: [400, 400]

  if Rails.env.production?
    storage :fog
  else
    storage :file
  end

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Add a white list of extensions which are allowed to be uploaded.
  def extension_allowlist
    %w[jpg jpeg gif png]
  end

  # Reject active content such as SVG files, even when their extension is renamed.
  def content_type_allowlist
    %r{\Aimage/(?:jpeg|png|gif)\z}
  end
end
