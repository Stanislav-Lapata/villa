class AddVillaIdToImages < ActiveRecord::Migration
  def change
    add_column :images, :villa_id, :integer
  end
end
