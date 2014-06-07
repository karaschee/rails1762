class CardType < ActiveRecord::Base
  has_many :cards, dependent: :nullify

  validates :name, presence: true
  
  default_scope order: "created_at DESC"

  NAME_ID_MAP = {
    djs: 1
  }
end
