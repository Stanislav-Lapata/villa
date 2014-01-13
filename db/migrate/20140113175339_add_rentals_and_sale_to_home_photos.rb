class AddRentalsAndSaleToHomePhotos < ActiveRecord::Migration
  def change
    add_column :home_photos, :rentals, :boolean, default: false
    add_column :home_photos, :sales, :boolean, default: false
  end
end
