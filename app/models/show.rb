class Show < ActiveRecord::Base
  has_many :volumes

  validates :name, presence: true
  validates :desc, presence: true

end
