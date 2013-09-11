class AddLatLngToVillas < ActiveRecord::Migration
  def change
    add_column :villas, :latitude, :string
    add_column :villas, :longitude, :string
  end
end
