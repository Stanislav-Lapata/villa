class AddVillasAndCarsPricesToVillas < ActiveRecord::Migration
  def change
    add_column :villas, :yacht_price, :decimal
    add_column :villas, :car_price, :decimal
  end
end
