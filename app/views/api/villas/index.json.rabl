collection @villas
attributes :id, :name, :price_from, :area_id

node(:image_url) { |villa| villa.images.first.image.url(:thumb) }
node(:original_image_url) { |villa| villa.images.first.image.url }
