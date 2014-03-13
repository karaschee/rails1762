class Tag < ActiveRecord::Base
  belongs_to :tagable, polymorphic: true
  validates :name, presence: true, uniqueness: { scope: [:tagable_id, :tagable_type] }
  validates :count, presence: true, uniqueness: { scope: [:name, :tagable_id, :tagable_type] }
end
