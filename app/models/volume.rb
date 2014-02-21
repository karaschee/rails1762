class Volume < ActiveRecord::Base
  belongs_to :show
  has_many :timelines, dependent: :destroy
  has_many :cards, through: :timelines
  # has_many :volume_tags
  # has_many :tags, through: "volume_tags"

  mount_uploader :thumbnail, ImageUploader
  
  validates :show_id,  presence: true
  validates :title,  presence: true, uniqueness: { scope: :show_id }

  def belonged_show
    show.present? ? show.name : "无"
  end
end
