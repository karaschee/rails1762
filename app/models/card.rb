class Card < ActiveRecord::Base
  mount_uploader :thumbnail, ImageUploader
  
  belongs_to :card_type
  has_many :timelines, dependent: :destroy
  has_many :volumes, through: :timelines

  validates :title, presence: true, uniqueness: { scope: :card_type_id }

  def card_type_name
    card_type.try(:name)
  end
end
