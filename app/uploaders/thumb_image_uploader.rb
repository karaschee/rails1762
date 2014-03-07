# encoding: utf-8
# require 'carrierwave/processing/minimagick'

class ThumbImageUploader < CarrierWave::Uploader::Base
  # require 'carrierwave/processing/mini_magick'
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    model_belong_id = model.thumb_imageable_id
    model_belong_type = model.thumb_imageable_type
    "uploads/#{model.class.to_s.underscore}/#{model_belong_type}/#{model_belong_id}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:

  # horizon
  version :hs do
    process :resize_to_fill => [80, 40]
  end
  version :hm do
    process :resize_to_fill => [300, 150]
  end
  version :hl do
    process :resize_to_fill => [600, 300]
  end

  # square
  version :ss do
    process :resize_to_fill => [80, 80]
  end
  version :sm do
    process :resize_to_fill => [180, 180]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
