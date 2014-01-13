class Show < ActiveRecord::Base
  has_many :volumes, dependent: :nullify

  validates :name, presence: true
  validates :desc, presence: true
end