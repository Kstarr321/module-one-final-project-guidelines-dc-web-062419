# Returns a string that is either 'y' or 'n'
def create?
    puts "Would you like to create an account? y/n"
    input = gets.chomp
    while input != "y" && input != "n" do 
        puts "invalid input...please enter 'y' or 'n'"
        input = gets.chomp 
    end 
    input 
end 

# Returns a string that is a name 
def ask_name
    puts "Great! What is your name?"
    name = gets.chomp 
    while name.to_i != 0 do
        puts "Sorry...please input your name again"
        name = gets.chomp 
    end 
    name
end 

def ask_for_username    
    puts "What would you like your username to be? (10 characters or less)"
    username = gets.chomp
    while username.length > 10 do 
        puts "Sorry that is too long, please try again"
        username = gets.chomp
    end 
    username
end 

#Returns an integer of the amount of money
def ask_for_funds
    puts "How much $$$$ would you like to start with? (<= 20k)"
    money = gets.chomp.to_i
    while money > 20000 || money == nil do 
        puts "That is too much, please enter an amount less than or equal to 20,000"
        money = gets.chomp
        money = money.to_i
    end 
    money
end 

def create_new_user(nname, uusername, funds)
    User.create(name: nname, username: uusername, account_balance: funds)
end 

#This method puts it all together in one nice wrapper 
def new_user_protocol(answer)
    if answer == "n"
        puts "Okay...well you can't login to someone else's account so....goodbye!"
    else 
        actual_name = ask_name
        actual_username = ask_for_username
        actual_funds = ask_for_funds
        new_user = create_new_user(actual_name, actual_username, actual_funds)
        puts "Congratulations #{new_user.name}, you now have an account and may log into our platform!"
    end 

end 