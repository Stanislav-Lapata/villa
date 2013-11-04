class AddPriceGuideToVillas < ActiveRecord::Migration
  def up
    add_column :villas, :price_guide, :text

    Villa.all.each do |villa|
      villa.update_attribute(:price_guide, I18n.t(:price_guide, scope: 'villa_info'))
    end
  end

  def down
    remove_column :villas, :price_guide, :text
  end
end
