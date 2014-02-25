class Show < ActiveRecord::Base
  has_one :thumb_image, as: :thumb_imageable
  has_many :volumes, dependent: :nullify

  accepts_nested_attributes_for :thumb_image
  
  validates :name,  presence: true, uniqueness: true
end