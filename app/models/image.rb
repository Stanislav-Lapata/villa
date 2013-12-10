class Image < ActiveRecord::Base
  mount_uploader :image, PhotoUploader
  belongs_to :villa

  default_scope order(:position)
end
