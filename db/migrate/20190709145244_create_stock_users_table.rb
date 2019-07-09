class CreateStockUsersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :users_stocks do |table|
      table.integer :user_id 
      table.integer :stock_id
    end
  end
end
