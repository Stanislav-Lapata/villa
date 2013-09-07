class AddSaleAdnRentalsToVillas < ActiveRecord::Migration
  def change
    add_column :villas, :rental, :boolean, default: true
    add_column :villas, :sale, :boolean, default: false
  end
end
