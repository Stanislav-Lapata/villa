class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.date :check_in
      t.date :check_out
      t.text :comments

      t.timestamps
    end
  end
end
