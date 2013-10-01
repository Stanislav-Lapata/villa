class AddTopAndLeftToAreas < ActiveRecord::Migration
  def change
    add_column :areas, :top, :string
    add_column :areas, :left, :string
  end
end
