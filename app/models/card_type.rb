class CardType < ActiveRecord::Base
  has_many :cards, dependent: :nullify

  validates :name, presence: true

  NAME_ID_MAP = {
    djs: 1
  }
end
