class Villa < ActiveRecord::Base
  extend Enumerize

  belongs_to :area
  has_many :images
  has_many :requests
  accepts_nested_attributes_for :images, reject_if: proc { |el| el[:image].blank? }, allow_destroy: true

  validates :name, presence: true
  validates :low_night, :high_night, :peak_night, presence: true

  before_create :set_phuket_rentals

  private

    def set_phuket_rentals
      self.house_rentals = rentals
      self.house_sales = sales
    end
end
