class User < ActiveRecord::Base

   has_many :users_stocks 
   has_many :stocks, through: :users_stocks 

   def buy_stock(ticker) 
      stock = Stock.find_by ticker: ticker 
      UsersStock.create(user: self, stock: stock)
      self.account_balance - stock.price
   end 

   def sell_all_stock(ticker)
      stock_to_sell = self.stocks.find {|stock_obj| stock_obj.ticker == ticker}
      UsersStock.where(stock_id: stock_to_sell.id).destroy_all 
      self.account_balance + stock_to_sell.price
   end 

   def cost_of_stock(stock)
      
   end 

   def show_owned_stocks
      x = User.find(self.id)
     a = x.stocks.each {|stock| puts "#{stock.ticker.upcase} >> Price: $#{stock.price}"}
   end 

end
