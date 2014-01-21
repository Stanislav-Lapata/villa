class AddSalePriceGuideToVillas < ActiveRecord::Migration
  def change
    add_column :villas, :price_guide_sale, :text
    add_column :villas, :price_guide_sale_ru, :text
    add_column :villas, :description_sale, :text
    add_column :villas, :description_sale_ru, :text
  end
end
