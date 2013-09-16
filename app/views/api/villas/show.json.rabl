object @villa
attributes :id, :name, :price_from, :price_to, :sale_price, :area_id,
           :location, :bedrooms, :sleeps_up_to, :latitude, :longitude, :zoom


child @villa.images, object_root: false do |image|
  attributes :id

  node(:image_url) { |image| image.image.url(:large) }
  node(:original_image_url) { |image| image.image.url }
end

child @villa.area object_root: false do |area|
  attributes :id, :name
end


node(:facilities) { @villa.facilities.split("\r\n") }
node(:services) { @villa.services.split("\r\n") }
node(:description) { simple_format(@villa.description.html_safe) }

node(:low_month) { @villa.low_month.to_f }
node(:low_week) { @villa.low_week.to_f }
node(:low_night) { @villa.low_night.to_f }
node(:high_month) { @villa.high_month.to_f }
node(:high_week) { @villa.high_week.to_f }
node(:high_night) { @villa.high_night.to_f }
node(:peak_month) { @villa.peak_month.to_f }
node(:peak_week) { @villa.peak_week.to_f }
node(:peak_night) { @villa.peak_night.to_f }
