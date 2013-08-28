node do |t|
  child t.children do |area|
    attributes :id, :name, :depth

    extends "api/areas/areas"
  end
end
