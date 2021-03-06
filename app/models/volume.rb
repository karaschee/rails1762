class Volume < ActiveRecord::Base
  belongs_to :show
  has_many :timelines, dependent: :destroy
  has_many :cards, through: :timelines
  has_many :tags, as: :tagable
  has_one :thumb_image, as: :thumb_imageable
  # has_many :volume_tags
  # has_many :tags, through: "volume_tags"

  accepts_nested_attributes_for :thumb_image
  validates :show_id,  presence: true
  validates :title,  presence: true, uniqueness: { scope: :show_id }

  def belonged_show
    show.present? ? show.name : "无"
  end

  def show_no
    no.nil? ? 'special' : "vol.#{no}"
  end
end
