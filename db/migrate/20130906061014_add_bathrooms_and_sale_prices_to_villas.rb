class AddBathroomsAndSalePricesToVillas < ActiveRecord::Migration
  def change
    add_column :villas, :bathrooms, :integer
    add_column :villas, :sale_price, :decimal
  end
end
