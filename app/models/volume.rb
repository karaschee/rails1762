class Volume < ActiveRecord::Base
  belongs_to :show

  validates :title, presence: true
  validates :desc, presence: true
end
