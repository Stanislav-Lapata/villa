class AddLftAndRgtToAreas < ActiveRecord::Migration
  def change
    add_column :areas, :lft, :integer
    add_column :areas, :rgt, :integer
  end
end
