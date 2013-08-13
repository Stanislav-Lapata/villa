class AddServicesToVillas < ActiveRecord::Migration
  def change
    add_column :villas, :services, :text
    add_column :villas, :facilities, :text
  end
end
