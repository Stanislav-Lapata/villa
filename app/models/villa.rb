class Villa < ActiveRecord::Base
  extend Enumerize
  attr_accessor :request_info

  belongs_to :area
  has_many :images, dependent: :destroy
  has_many :requests, dependent: :destroy
  accepts_nested_attributes_for :images, reject_if: proc { |el| el[:image].blank? }, allow_destroy: true

  validates :name, presence: true

  scope :for_rent, -> { where(rental: true) }
  scope :for_sale, -> { where(sale: true) }
  scope :recent, -> { where('(description is not null) and (description_ru is not null)').order('created_at desc') }

  scope :yacht_rentals, -> { where(yacht_rentals: true) }
  scope :car_rentals, -> { where(car_rentals: true) }

  def to_param
    "#{id} #{name}".parameterize
  end

  def send_info(info)
    self.request_info = info
    # Notifier.new_owner_request_notification(self).deliver
  end

  def price_guide
    if I18n.locale == :ru
      price_guide_ru
    else
      read_attribute('price_guide')
    end
  end

  def description
    if I18n.locale == :ru
      description_ru
    else
      read_attribute('description')
    end
  end

  def price_guide_sale
    if I18n.locale == :ru
      price_guide_sale_ru
    else
      read_attribute('price_guide_sale')
    end
  end

  def description_sale
    if I18n.locale == :ru
      description_sale_ru
    else
      read_attribute('description_sale')
    end
  end
end
