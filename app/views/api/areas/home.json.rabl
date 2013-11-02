collection @areas
attributes :id, :name

child(:self_and_descendants_villas, object_root: false) do |villa|
  attributes :id, :name, :price_from, :price_to, :area_id, :bedrooms, :sleeps_up_to, :location

  node(:image_url) { |villa| villa.images.first.try(:image).try(:url, :thumb) }
end
