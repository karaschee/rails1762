class Timeline < ActiveRecord::Base
  belongs_to :card
  belongs_to :volume

  validates :at_time, presence: true
  validates :volume_id, presence: true
  validates :card_id, presence: true

  def card_title
    card.title
  end
end
