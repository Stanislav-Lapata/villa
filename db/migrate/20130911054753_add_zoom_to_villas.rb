class AddZoomToVillas < ActiveRecord::Migration
  def change
    add_column :villas, :zoom, :string
  end
end
