class Villa < ActiveRecord::Base
  extend Enumerize

  belongs_to :area
  has_many :images
  has_many :requests
  accepts_nested_attributes_for :images, reject_if: proc { |el| el[:image].blank? }, allow_destroy: true

  validates :name, presence: true
end
