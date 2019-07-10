def return_stock_tickers
    Stock.all.each do |stock|
        puts "#{stock.ticker.upcase} >>>>> $#{stock.price}/share" 
    end 
end 

def greeting
    puts "_________________________________________"
    puts "_________________________________________"
    puts "_________________________________________"
    puts "                                         "
    puts "Hello, welcome to Kolton's Stock Exchange"
    puts "_________________________________________"
    puts "_________________________________________"
    puts "_________________________________________"
    puts "                                         "
    puts "Please type in your username to continue: "
end 

def no_username_error
    puts "Sorry...we couldn't find that username. Program ending......."
end

def username_checker(str) 
    obj = User.find_by username: str 
    if obj == nil 
        no_username_error
    else
        puts "********************************"
        puts "Hello #{obj.name}. Welcome back!"
        puts "********************************"
        puts "                                "
        display_menu
    end 
end 

def display_menu
    puts "Please make a selection from the menu below!"
    puts "___________________________________________"

    puts "1. Show list of stocks to choose from"
    puts "2. Go to StockMover Platform"
    puts "3. Show list of owned stocks"
    puts "4. End program"
end 

def stock_mover_menu
    puts ">>>>>>>>>"
    puts "Would you like to buy a stock or sell all of one of your current stocks?"
    puts ">>>>>>>>>" 
    puts "Please enter: buy/sell"

end 

def stock_buyer(user_obj)
    puts "Please enter a lowercase 4-letter ticker symbol of what you would like to buy: "
    ticker = gets.chomp
    user_obj.buy_stock(ticker)
    puts "                        "
    puts "                        "
    puts "Order Confirmation: #{ticker.upcase}(BUY 1 SH) >>>>>> COMPLETE"
end

def stock_seller(user_obj)
    puts "Please enter a lowercase 4-letter ticker symbol that you own to sell_all"
    ticker = gets.chomp 
    user_obj.sell_all_stock(ticker)
    puts "                        "
    puts "                        "
    puts "Order Confirmation: #{ticker.upcase}(SELL ALL) >>>>>> COMPLETE"
end 

def stock_mover(obj)
    stock_mover_menu
    opt = gets.chomp 
    if opt == 'buy'
        stock_buyer(obj)
    elsif opt == 'sell'
        stock_seller(obj)
    else 
        puts "Invalid Input"
    end 
end 

def runner(num, user_obj)
    if num.to_i == nil 
        puts "Sorry....that is an incorrect input"
    elsif num.to_i == 1 
        return_stock_tickers
    elsif num.to_i == 2 
        stock_mover(user_obj)
    elsif num.to_i == 3 
        if user_obj.stocks.empty?
            puts "Whoops! It looks like you don't own any stocks!"
        else 
            user_obj.show_owned_stocks 
        end 
    elsif num.to_i == 4 
        puts "Thanks for using our platform! Goodbye!"
    else 
        puts "goodbye"
    end 
end 





