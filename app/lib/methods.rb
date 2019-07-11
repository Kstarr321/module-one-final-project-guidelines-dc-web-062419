require 'pastel'
def return_stock_tickers
    Stock.all.each do |stock|
        puts "#{stock.ticker.upcase} >>>>> $#{stock.price}/share" 
    end 
end  

def greeting
    pastel = Pastel.new 
    puts pastel.decorate("_________________________________________", :on_bright_red, :bold)
    puts pastel.decorate("_________________________________________", :on_bright_cyan, :bold)
    puts pastel.decorate("_________________________________________", :on_bright_green, :bold)
    puts pastel.decorate("Hello, welcome to Kolton's Stock Exchange".upcase, :bright_white, :on_black, :bold)
    puts pastel.decorate("_________________________________________", :on_bright_green, :bold)
    puts pastel.decorate("_________________________________________", :on_bright_cyan, :bold)
    puts pastel.decorate("_________________________________________", :on_bright_red, :bold)
    puts "                                         "
end 

def no_username_error
    puts "Sorry...we couldn't find that username. Program ending......."
end

def prompt
    puts "Are you currently an existing user? y/n"
    input = gets.chomp #this will be a string of one letter 'y' or 'n'
    if input == 'y'
        return 'y'
    elsif input == 'n'
        return 'n'
    else 
        puts 'Invalid Input'
    end 
end 
# prompt that asks the user if they already have an account....if they do...put them through the user_name checker method. 
# if they dont....i will ask them if they want to create a user id...if not then i will end the program
# if they do want to create one....I will ask them for a username, a name, and how much they would like to start their account with..
# then i will create the new user and save them to the database with the approprate information and then put them through the u
# username checker method 
def username_checker
    pastel = Pastel.new
    user_obj = nil 
    while user_obj == nil do 
        puts "What is your username?"
        user_input = gets.chomp 
        user_obj = User.find_by username: user_input
        break if user_input == "stop"
    end
        puts pastel.decorate("********************************", :magenta, :bold)
        puts pastel.decorate("Hello #{user_obj.name}. Welcome back!", :bright_white, :bold)
        puts pastel.decorate("********************************", :magenta, :bold)
        puts "                                "
        user_obj
end 

def display_menu
    puts "Please make a selection from the menu below!"
    puts "___________________________________________"

    puts "1. Show list of stocks to choose from"
    puts "2. Go to StockMover Platform"
    puts "3. Show list of owned stocks"
    puts "4. Go to StockAdder Platform"
    puts "5. End program"
    input = gets.chomp
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

def stock_adder(symbol)
    pastel = Pastel.new 
    if symbol.class == String && symbol.length == 4
        new_stock = Stock.create(
            ticker: symbol, 
            price: (Faker::Commerce.price)
        )
        puts "Confirmation: #{new_stock.ticker} has been added successfully to our platform!"
    else 
        puts pastel.decorate("Error:>>>>>>>>>>>>>>>>invalid input".upcase, :red, :bold)
    end 
end 

def stock_adder_platform
    pastel = Pastel.new
    puts pastel.decorate("<<<<<Welcome to the StockAdder Platform>>>>>".upcase, :bright_white, :bold)
    puts "If there is a stock that is not offered on our platform, please enter the 4 letter ticker symbol and we will add it: "
    input = gets.chomp 
    stock_adder(input)
end 




def runner(num, user_obj)
    pastel = Pastel.new
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
        stock_adder_platform
    elsif num.to_i == 5
        puts "Thanks for using our platform! Goodbye!"
    else 
        puts "goodbye"
    end 
end 





