collection @villas
attributes :id, :name, :price_from, :area_id

node(:image_url) { |villa| villa.images.first.try(:image).try(:url, :thumb) }
node(:original_image_url) { |villa| villa.images.first.try(:image).try(:url) }
