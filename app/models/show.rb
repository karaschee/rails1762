class Show < ActiveRecord::Base
  has_one :thumb_image, as: :thumb_imageable, dependent: :destroy
  # has_many :tags, as: :tagable
  has_many :volumes, dependent: :nullify

  accepts_nested_attributes_for :thumb_image, :allow_destroy => true,
                                :reject_if => lambda {|a| a[:asset].blank?}
  
  validates :name,  presence: true, uniqueness: true

  NAME_ID_MAP = {
    gadio: 1,
    twod: 2
  }

  def label_class
    case id
    when Show::NAME_ID_MAP[:gadio]
      'label label-primary'
    when Show::NAME_ID_MAP[:twod]
      'label label-success'
    end
  end
end