class AddRusDescriptionsToVillas < ActiveRecord::Migration
  def change
    add_column :villas, :price_guide_ru, :text
    add_column :villas, :description_ru, :text
  end
end
