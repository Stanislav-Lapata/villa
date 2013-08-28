collection @villas
attributes :id, :name, :price_from, :area_id

node(:image_url) { |post| post.images.first.image.url(:thumb) }
node(:original_image_url) { |post| post.images.first.image.url }
