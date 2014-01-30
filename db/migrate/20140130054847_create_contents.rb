class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :kind
      t.text :value
      t.text :value_ru
      t.string :description
      t.string :description_ru
      t.string :keywords
      t.string :keywords_ru

      t.timestamps
    end
  end
end
