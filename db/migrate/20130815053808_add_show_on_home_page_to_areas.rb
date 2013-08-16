class AddShowOnHomePageToAreas < ActiveRecord::Migration
  def change
    add_column :areas, :show_on_home_page, :boolean, default: false
  end
end
