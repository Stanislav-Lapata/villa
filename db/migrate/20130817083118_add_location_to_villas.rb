class AddLocationToVillas < ActiveRecord::Migration
  def change
    add_column :villas, :location, :string
  end
end
