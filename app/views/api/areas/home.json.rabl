collection @areas
attributes :id, :name

child(:self_and_descendants_villas, object_root: false) do |villa|
  attributes :id, :name, :price_from

  node(:image_url) { |villa| villa.images.first.image.url(:thumb) }
end
