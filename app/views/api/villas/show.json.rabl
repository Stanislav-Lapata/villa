object @villa
attributes :id, :name, :price_from, :price_to, :area_id, :location, :bedrooms, :sleeps_up_to, :latitude, :longitude, :zoom

child @villa.images, object_root: false do |image|
  attributes :id

  node(:image_url) { |image| image.image.url(:large) }
end

child @villa.area object_root: false do |area|
  attributes :id, :name
end


node(:facilities) { @villa.facilities.split("\r\n") }
node(:services) { @villa.services.split("\r\n") }
node(:description) { simple_format(@villa.description.html_safe) }
