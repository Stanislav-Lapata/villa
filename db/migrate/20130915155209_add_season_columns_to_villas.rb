class AddSeasonColumnsToVillas < ActiveRecord::Migration
  def change
    add_column :villas, :low_month, :decimal
    add_column :villas, :low_week, :decimal
    add_column :villas, :low_night, :decimal
    add_column :villas, :high_month, :decimal
    add_column :villas, :high_week, :decimal
    add_column :villas, :high_night, :decimal
    add_column :villas, :peak_month, :decimal
    add_column :villas, :peak_week, :decimal
    add_column :villas, :peak_night, :decimal
  end
end
