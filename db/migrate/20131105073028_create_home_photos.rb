class CreateHomePhotos < ActiveRecord::Migration
  def change
    create_table :home_photos do |t|
      t.string :name
      t.string :image

      t.timestamps
    end
  end
end
