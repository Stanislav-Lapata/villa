node do |t|
  child t.children do |area|
    attributes :id, :name, :depth

    node(:rental) { |area| area.rental? }
    node(:sale) { |area| area.sale? }

    extends "api/areas/areas"
  end
end
