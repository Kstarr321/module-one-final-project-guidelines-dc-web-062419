require_relative "config/environment.rb"
require_relative "app/lib/methods.rb"

greeting
user_input = gets.chomp #this will take in a string and it should match and existing user in the database
user_obj = User.find_by username: user_input

username_checker(user_input)
#display_menu

user_menu_opt = gets.chomp 
# I need a method with 4 methods wrapped into it corresponding to each options. The method will check the number selected and run the appropriate method corresponding to the inputted number. It will first need to be converted to an integer. I will also need a failsafe in place in case the input is not a number or it's a number that is less than 1 or greater than four 

runner(user_menu_opt, user_obj)
