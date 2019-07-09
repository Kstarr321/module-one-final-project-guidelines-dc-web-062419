class User < ActiveRecord::Base

   has_many :users_stocks # ActiveRecord....I have no idea what is happening here
   has_many :stocks, through: :users_stocks # ActiveRecord....I have no idea what is happening here

   def buy_stock(ticker) #string of 4 letters 
      stock = Stock.find_by ticker: ticker 
      UsersStock.create(user: self, stock: stock)
   end 

   def show_owned_stocks(arr)
      arr.each do |obj|
         sid = obj.stock_id
         Stock.find_by stock_id: sid
      end 

   end

   def show_stock_objects_owned
      uid = self.id 
      owned = []
      UsersStock.all.each do |relation|
         if relation.user_id == uid 
            owned << relation
         end 
      end 
      owned
      binding.pry
      show_owned_stocks(owned)
   end 

    




end
