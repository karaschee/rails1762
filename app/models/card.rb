class Card < ActiveRecord::Base
  belongs_to :card_type
  has_one :thumb_image, as: :thumb_imageable, dependent: :destroy
  has_many :timelines, dependent: :destroy
  has_many :volumes, through: :timelines
  has_many :tags, as: :tagable, dependent: :destroy
  accepts_nested_attributes_for :thumb_image, :allow_destroy => true,
                                :reject_if => lambda {|a| a[:asset].blank?}

  validates :title, presence: true, uniqueness: { scope: :card_type_id }

  default_scope order: "created_at DESC"

  def card_type_name
    name = card_type.try(:name)
    name.present? ? name : "无"
  end
end
