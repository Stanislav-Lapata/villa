class AddPhuketColumnsToVillas < ActiveRecord::Migration
  def change
    add_column :villas, :house_rentals, :boolean
    add_column :villas, :house_sales, :boolean
    add_column :villas, :yacht_rentals, :boolean
    add_column :villas, :car_rentals, :boolean
    add_column :villas, :real_estate, :boolean
  end
end
