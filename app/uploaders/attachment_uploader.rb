# encoding: utf-8

class AttachmentUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  # For testing, upload files to local `tmp` folder.
  if Rails.env.test? || Rails.env.cucumber?
    storage :file
    enable_processing false
    root "#{Rails.root}/tmp"
  elsif Rails.env.development?
    storage :file
    enable_processing false
  else
    storage :fog
  end
  
  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url
  end

  # Process files as they are uploaded:
  version :display do
    process :resize_to_fill => [150, 150]
  end

  # Create different versions of your uploaded files:
  version :thumb do
    process :resize_to_fill => [60, 60]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  def extension_white_list
    %w(jpg jpeg gif png pdf)
  end

end