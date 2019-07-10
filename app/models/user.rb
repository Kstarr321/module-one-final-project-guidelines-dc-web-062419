class User < ActiveRecord::Base

   has_many :users_stocks # ActiveRecord....I have no idea what is happening here
   has_many :stocks, through: :users_stocks # ActiveRecord....I have no idea what is happening here

   def buy_stock(ticker) 
      stock = Stock.find_by ticker: ticker 
      UsersStock.create(user: self, stock: stock)
   end 

   def sell_all_stock(ticker)
      stock_to_sell = self.stocks.find {|stock_obj| stock_obj.ticker == ticker}
      UsersStock.where(stock_id: stock_to_sell.id).destroy_all
   end 

   def cost_of_stock(stock)
      
   end 

   def show_owned_stocks
     a = self.stocks.each {|stock| puts "#{stock.ticker.upcase} >> Price: $#{stock.price}"}
   end 

    




end
