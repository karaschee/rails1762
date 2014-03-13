class Card < ActiveRecord::Base
  belongs_to :card_type
  has_many :timelines, dependent: :destroy
  has_many :volumes, through: :timelines
  has_one :thumb_image, as: :thumb_imageable
  has_many :tags, as: :tagable
  accepts_nested_attributes_for :thumb_image

  validates :title, presence: true, uniqueness: { scope: :card_type_id }

  def card_type_name
    name = card_type.try(:name)
    name.present? ? name : "无"
  end
end
