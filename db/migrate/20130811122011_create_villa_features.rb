class CreateVillaFeatures < ActiveRecord::Migration
  def change
    create_table :villa_features do |t|
      t.string :name
      t.string :type
      t.integer :villa_id

      t.timestamps
    end
  end
end
