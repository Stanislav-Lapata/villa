class AddLeftTailToAreas < ActiveRecord::Migration
  def change
    add_column :areas, :left_tail, :string
  end
end
