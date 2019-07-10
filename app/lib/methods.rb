def return_stock_tickers
    Stock.all.each do |stock|
        puts "#{stock.ticker.upcase} >>>>> $#{stock.price}/share" 
    end 
end 

def greeting
    puts "Hello, welcome to Kolton's Stock Exchange"
    puts "_________________________________________"
    puts "_________________________________________"
    puts "_________________________________________"
    puts "Please type in your username to continue: "
end 

def no_username_error
    puts "Sorry...we couldn't find that username. Program ending......."
end

def username_checker(str) #This method is only returning the names of user's that actually own stocks(PROBLEM)
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

def stock_buyer(user_obj)
    puts "Please enter a lowercase 4-letter ticker symbol of what you would like to buy: "
    ticker = gets.chomp
    user_obj.buy_stock(ticker)
end 




def runner(num, user_obj)
    if num.to_i == nil 
        puts "Sorry....that is an incorrect input"
    elsif num.to_i == 1 
        return_stock_tickers
    elsif num.to_i == 2 
        stock_buyer(user_obj)
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





