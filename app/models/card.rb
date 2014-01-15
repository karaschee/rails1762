class Card < ActiveRecord::Base
  belongs_to :card_type
  has_many :timelines, dependent: :destroy
  has_many :volumes, through: :timelines

  validates :title, presence: true, uniqueness: { scope: :card_type_id }
end
