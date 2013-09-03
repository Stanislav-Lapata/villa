class ChangeRentalsColumns < ActiveRecord::Migration
  def up
    remove_column :areas, :category
    add_column :areas, :rental, :boolean, default: true
    add_column :areas, :sale, :boolean, default: false
  end

  def down
    add_column :areas, :category, :string
    remove_column :areas, :rental
    remove_column :areas, :sale
  end
end
