class Show < ActiveRecord::Base
  has_many :volumes, dependent: :nullify

  validates :name,  presence: true, uniqueness: true
end