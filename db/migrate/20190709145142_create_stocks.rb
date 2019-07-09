class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |table|
      table.string :ticker 
      table.integer :price 
    end 
  end
end
