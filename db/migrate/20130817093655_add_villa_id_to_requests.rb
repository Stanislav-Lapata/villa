class AddVillaIdToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :villa_id, :integer
  end
end
