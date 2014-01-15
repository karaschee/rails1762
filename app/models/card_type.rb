class CardType < ActiveRecord::Base
  has_many :cards, dependent: :nullify

  validates :name, presence: true
end
