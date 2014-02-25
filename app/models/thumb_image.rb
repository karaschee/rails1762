class ThumbImage < ActiveRecord::Base
  mount_uploader :asset, ThumbImageUploader
  belongs_to :thumb_imageable, polymorphic: true
end
