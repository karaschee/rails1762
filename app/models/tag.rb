class Tag < ActiveRecord::Base
  belongs_to :tagable, polymorphic: true
  validates :name, presence: true, length: { maximum: 15 }, uniqueness: { scope: [:tagable_id, :tagable_type] }
  validates :count, presence: true, uniqueness: { scope: [:name, :tagable_id, :tagable_type] }
end
