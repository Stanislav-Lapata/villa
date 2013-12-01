collection @areas
attributes :id, :name, :depth, :top, :left_tail


child(:self_and_descendants_villas, object_root: false) do |villa|
  attributes :id, :name, :price_from, :price_to, :area_id, :bedrooms, :sleeps_up_to, :location

  node(:image_url) { |villa| villa.images.first.try(:image).try(:url, :thumb) }
end

node(:pretty_name) { |area| area.pretty_name }
node(:rental) { |area| area.rental? }
node(:sale) { |area| area.sale? }
node(:left) { |area| area.read_attribute(:left) }
