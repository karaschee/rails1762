class Show < ActiveRecord::Base
  mount_uploader :thumbnail, ImageUploader
  
  has_many :volumes, dependent: :nullify

  validates :name,  presence: true, uniqueness: true
end