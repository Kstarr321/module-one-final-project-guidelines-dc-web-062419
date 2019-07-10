require_relative "config/environment.rb"
require_relative "app/lib/methods.rb"

greeting

user_obj = username_checker
display_menu
user_menu_opt = gets.chomp 

runner(user_menu_opt, user_obj) 
