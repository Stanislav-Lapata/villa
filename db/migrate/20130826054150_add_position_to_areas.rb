class AddPositionToAreas < ActiveRecord::Migration
  def change
    add_column :areas, :position, :integer
  end
end
