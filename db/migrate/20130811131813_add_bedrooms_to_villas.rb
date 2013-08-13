class AddBedroomsToVillas < ActiveRecord::Migration
  def change
    add_column :villas, :bedrooms, :integer
    add_column :villas, :sleeps_up_to, :integer
  end
end
