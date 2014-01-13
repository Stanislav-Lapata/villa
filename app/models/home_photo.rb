class HomePhoto < ActiveRecord::Base
  mount_uploader :image, HomePhotoUploader

  scope :for_home, -> { where(rentals: false, sales: false) }
  scope :for_rent, -> { where(rentals: true) }
  scope :for_sale, -> { where(sales: true) }
end
