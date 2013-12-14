class HomePhoto < ActiveRecord::Base
  mount_uploader :image, HomePhotoUploader
end
