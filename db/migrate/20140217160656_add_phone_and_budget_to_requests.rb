class AddPhoneAndBudgetToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :budget_per_night, :integer
    add_column :requests, :phone, :string
  end
end
