class AddDomainToVillas < ActiveRecord::Migration
  def change
    add_column :villas, :domain, :string
  end
end
