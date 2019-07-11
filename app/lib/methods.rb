require 'pastel'
def return_stock_tickers(user_obj) 
    Stock.all.each do |stock|
        puts "#{stock.ticker.upcase} >>>>> $#{stock.price}/share" 
    end 
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
      pie_chart = TTY::Pie.new(data: data, left: 50, top: 10)
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
    pastel = Pastel.new
    puts "Please enter a lowercase 4-letter ticker symbol of what you would like to buy: "
    ticker = gets.chomp
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
    ticker = gets.chomp 
    user_obj.sell_all_stock(ticker)
    puts "                        "
    puts "                        "
    confirm = pastel.decorate("#{ticker.upcase}(SELL ALL) >>>>>> COMPLETE", :green, :bold) 
    puts pastel.decorate("Order Confirmation:  ", :bright_white, :bold) + confirm
    existing_user_run(user_obj)
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
    input = gets.chomp 
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
            puts "Whoops! It looks like you don't own any stocks!"
        else 
            user_obj.show_owned_stocks
            existing_user_run(user_obj) 
        end 
    elsif num.to_i == 4
        stock_adder_platform(user_obj)#######################
    elsif num.to_i == 5
        5.times do 
            puts "      "
        end 
        puts "Thanks for using our platform! Goodbye!"
        print_logo
    else 
        puts "GOODBYE!"
        print_logo
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





