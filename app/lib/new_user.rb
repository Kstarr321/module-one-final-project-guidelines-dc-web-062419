require_relative "methods.rb"
def create?
    puts " "
    puts " "
    puts "Would you like to create an account? y/n"
    input = gets.strip
    while input != "y" && input != "n" do 
        puts "invalid input...please enter 'y' or 'n'"
        input = gets.strip
    end 
    input 
end  

# Returns a string that is a name 
def ask_name
    puts "Great! What is your name?"
    name = gets.strip
    while name.to_i != 0 do
        puts "Sorry...please input your name again"
        name = gets.strip
    end 
    spacer
    puts "Nice to meet you #{name}!"
    spacer
    name
end 

def ask_for_username 
    puts "What would you like your username to be? (10 characters or less)"
    username = gets.strip
    while username.length > 10 do 
        puts "Sorry that is too long, please try again"
        spacer
        username = gets.strip
    end 
    spacer
    username
end 

#Returns an integer of the amount of money
def ask_for_funds
    puts "Please fund your account >>> enter an amount less than $20,000 (no symbols, no commas)"
    money = gets.strip.to_i
    while money > 20000 || money == 0 do 
        puts "That is too much, please enter an amount less than or equal to 20,000"
        money = gets.strip
        money = money.to_i
    end 
    money
end 

def create_new_user(nname, uusername, funds)
    User.create(name: nname, username: uusername, account_balance: funds)
end 

#This method puts it all together in one nice wrapper 
def new_user_protocol(answer)
    pastel = Pastel.new 
    if answer == "n"
        puts " "
        puts " "
        puts pastel.decorate(">>>>>>>Goodbye!>>>>>>>".upcase, :bright_white, :bold)
        print_logo
    else 
        actual_name = ask_name
        actual_username = ask_for_username
        actual_funds = ask_for_funds
        new_user = create_new_user(actual_name, actual_username, actual_funds)
        puts "Congratulations #{new_user.name}, you now have an account and may log into our platform!"
        puts "Now returning you to login screen....."
        user_obj = username_checker#####################
        user_menu_opt = display_menu ###################
        runner(user_menu_opt, user_obj)################
    end 

end 