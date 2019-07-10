class User < ActiveRecord::Base

   has_many :users_stocks # ActiveRecord....I have no idea what is happening here
   has_many :stocks, through: :users_stocks # ActiveRecord....I have no idea what is happening here

   def buy_stock(ticker) #string of 4 letters 
      stock = Stock.find_by ticker: ticker 
      a = UsersStock.create(user: self, stock: stock)
   end 

   def sell_stock(stock)

   end 

   def cost_of_stock(stock)

   end 

   def show_owned_stocks
     self.stocks.each {|stock| puts "#{stock.ticker.upcase} >> Price: $#{stock.price}"}
   end 

    




end
