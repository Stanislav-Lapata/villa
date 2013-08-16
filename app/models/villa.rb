class Villa < ActiveRecord::Base
  belongs_to :area
  has_many :images
  accepts_nested_attributes_for :images, reject_if: proc { |el| el[:image].blank? }, allow_destroy: true
end
