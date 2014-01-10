class Volume < ActiveRecord::Base
  belongs_to :show

  validates :title, presence: true
  validates :desc, presence: true

  def belonged_show
    show.present? ? show.name : "无"
  end
end
