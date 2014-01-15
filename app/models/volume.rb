class Volume < ActiveRecord::Base
  belongs_to :show
  # has_many :timelines, dependent: :destroy
  # has_many :cards, through: "timelines"
  # has_many :volume_tags
  # has_many :tags, through: "volume_tags"
  
  validates :show_id,  presence: true
  validates :title,  presence: true, uniqueness: true

  def belonged_show
    show.present? ? show.name : "无"
  end
end
