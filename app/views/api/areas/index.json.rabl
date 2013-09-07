collection @areas
attributes :id, :name, :depth

node do |area|
  partial("api/areas/areas", object: area)
end

node(:pretty_name) { |area| area.pretty_name }
node(:rental) { |area| area.rental? }
node(:sale) { |area| area.sale? }
