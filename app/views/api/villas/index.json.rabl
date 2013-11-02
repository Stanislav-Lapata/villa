collection @villas
attributes :id, :name, :price_from, :price_to, :area_id, :bedrooms, :sleeps_up_to, :location

node(:image_url) { |villa| villa.images.first.try(:image).try(:url, :thumb) }
node(:original_image_url) { |villa| villa.images.first.try(:image).try(:url) }
