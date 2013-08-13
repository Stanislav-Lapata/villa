class CreateVillas < ActiveRecord::Migration
  def change
    create_table :villas do |t|
      t.string :name
      t.text :description
      t.decimal :price_from
      t.decimal :price_to
      t.integer :area_id

      t.timestamps
    end
  end
end
