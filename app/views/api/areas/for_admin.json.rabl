collection @areas
attributes :id, :name

node(:pretty_name) { |area| area.pretty_name }
