class AddCategoryToVillas < ActiveRecord::Migration
  def change
    add_column :areas, :category, :string
  end
end
