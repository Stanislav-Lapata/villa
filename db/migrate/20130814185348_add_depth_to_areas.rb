class AddDepthToAreas < ActiveRecord::Migration
  def change
    add_column :areas, :depth, :integer
  end
end
