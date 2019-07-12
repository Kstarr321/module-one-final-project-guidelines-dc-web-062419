require 'pastel'
def return_stock_tickers(user_obj) 
    Stock.all.each do |stock|
        puts "#{stock.ticker.upcase} >>>>> $#{stock.price}/share" 
        
    end 
    puts ""
    puts "Returning you to main menu....."
    user_menu_opt = display_menu 
    runner(user_menu_opt, user_obj)
end  

def print_logo
    data = [
        { name: 'PEACE', value: 1, color: :bright_green, fill: 'X' },
        { name: 'LOVE', value: 1, color: :bright_red, fill: 'X' },
        { name: 'POSITIVITY', value: 1, color: :bright_white, fill: 'X' },
        { name: 'HARD WORK', value: 1, color: :bright_cyan, fill: 'X' }
      ]
      pie_chart = TTY::Pie.new(data: data, radius: 5)
      print pie_chart

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

def prompt ################### Add the ability for 'yes' and 'no' also downcase it
    puts "Are you currently an existing user? y/n"
    input = gets.strip.downcase
    while input != "y" && input != "n" do 
        puts "invalid input...please enter 'y' or 'n'"
        input = gets.strip.downcase
    end 
    input
end 

def username_checker
    pastel = Pastel.new
    user_obj = nil 
    while user_obj == nil do 
        puts "What is your username?"
        user_input = gets.strip
        user_obj = User.find_by username: user_input
        break if user_input == "stop"
    end
        puts pastel.decorate("********************************", :magenta, :bold)
        puts pastel.decorate("Hello #{user_obj.name}. Welcome back!", :bright_white, :bold)
        puts pastel.decorate("********************************", :magenta, :bold)
        puts "                                "
        user_obj
end 

def spacer 
    5.times do 
        puts ""
    end
end 
def display_menu
    pastel = Pastel.new
    spacer
    puts pastel.decorate("Please make a selection from the menu below:".upcase, :cyan, :bold)
    puts "___________________________________________"

    puts pastel.decorate("1. Show ALL stocks offered", :bright_white)
    puts pastel.decorate("2. Go to Stock Buyer/Seller Platform", :bright_white)
    puts pastel.decorate("3. Show your Owned Stocks", :bright_white)
    puts pastel.decorate("4. Go to StockAdder Platform", :bright_white)
    puts pastel.decorate("5. End program", :bright_white)
    input = gets.strip
end 

def stock_mover_menu
    puts ">>>>>>>>>"
    puts "Would you like to buy a stock or sell all of one of your current stocks?"
    puts ">>>>>>>>>" 
    puts "Please enter: buy/sell"

end 

def stock_buyer(user_obj)
    pastel = Pastel.new
    puts "Please enter a lowercase 4-letter ticker symbol of what you would like to buy: "
    ticker = gets.strip
    stock = Stock.find_by ticker: ticker 
    
    while stock == nil do ###################################
        puts "Please enter a VALID 4 letter ticker symbol to add"
        ticker = gets.strip 
        stock = Stock.find_by ticker: ticker
    end 
    
    user_obj.buy_stock(ticker)
    puts "                        "
    puts "                        "
    confirm = pastel.decorate("#{ticker.upcase}(BUY 1 SH) >>>>>> COMPLETE", :green, :bold) 
    puts pastel.decorate("Order Confirmation:  ", :bright_white, :bold) + confirm
    existing_user_run(user_obj)
    
end

def stock_seller(user_obj)
    pastel = Pastel.new
    puts "Please enter a lowercase 4-letter ticker symbol that you own to sell_all"
    ticker = gets.strip 
    while !user_obj.stocks.include? Stock.find_by ticker: ticker  do 
        puts "You don't own that stock...pleas enter one that you own"
        ticker = gets.strip 
    end 
    
    user_obj.sell_all_stock(ticker)
    puts "                        "
    puts "                        "
    confirm = pastel.decorate("#{ticker.upcase}(SELL ALL) >>>>>> COMPLETE", :green, :bold) 
    puts pastel.decorate("Order Confirmation:  ", :bright_white, :bold) + confirm
    existing_user_run(user_obj)
end 

def stock_mover(obj)
    stock_mover_menu
    
    opt = gets.strip 
    if opt == 'buy'
        stock_buyer(obj)
    elsif opt == 'sell'
        stock_seller(obj)
    else 
        puts "Invalid Input"
        existing_user_run(obj) 
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

def stock_adder_platform(user_obj)############################
    pastel = Pastel.new
    puts pastel.decorate("<<<<<Welcome to the StockAdder Platform>>>>>".upcase, :bright_white, :bold)
    puts "If there is a stock that is not offered on our platform, please enter the 4 letter ticker symbol and we will add it: "
    input = gets.strip 
    stock_adder(input)
    existing_user_run(user_obj)############################
end 

def runner(num, user_obj)
    pastel = Pastel.new
    
    if num.to_i == nil 
        puts "Sorry....that is an incorrect input"
    elsif num.to_i == 1 
        return_stock_tickers(user_obj)
    elsif num.to_i == 2 
        stock_mover(user_obj)
    elsif num.to_i == 3 
        if user_obj.stocks.empty?
            spacer
            puts "Whoops! It looks like you don't own any stocks!"
            existing_user_run(user_obj)
        else 
            user_obj.show_owned_stocks
            existing_user_run(user_obj) 
        end 
    elsif num.to_i == 4
        stock_adder_platform(user_obj)
    elsif num.to_i == 5
        5.times do 
            puts "      "
        end 
        puts pastel.decorate("Thanks for using our platform! Goodbye!", :bright_white, :bold)
        print_logo
    else 
        spacer 
        puts pastel.decorate("INVALID INPUT >>>> Returning you to Main Menu", :bright_red)
        existing_user_run(user_obj)
    end 
end 

def existing_user_protocol 
    user_obj = username_checker
    user_menu_opt = display_menu 
    runner(user_menu_opt, user_obj)
end

def existing_user_run(user_obj)
    user_menu_opt = display_menu 
    runner(user_menu_opt, user_obj)
end 





