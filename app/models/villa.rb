class Villa < ActiveRecord::Base
  extend Enumerize

  belongs_to :area
  has_many :images
  has_many :requests
  accepts_nested_attributes_for :images, reject_if: proc { |el| el[:image].blank? }, allow_destroy: true

  validates :name, presence: true
  validates :low_night, :high_night, :peak_night, presence: true

  scope :for_rent, -> { where(rental: true) }
  scope :for_sale, -> { where(sale: true) }
  scope :recent, -> { order('created_at desc') }

  scope :yacht_rentals, -> { where(yacht_rentals: true) }
  scope :car_rentals, -> { where(car_rentals: true) }
end
