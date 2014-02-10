class AddOwnerEmailToVillas < ActiveRecord::Migration
  def change
    add_column :villas, :owner_email, :string
  end
end
