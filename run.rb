require_relative "config/environment.rb"
require_relative "app/lib/methods.rb"

puts "Hello, welcome to Kolton's Stock Exchange"
puts "_________________________________________"
puts "_________________________________________"
puts "_________________________________________"





puts "please type in your username to continue:  "
user_input = gets.chomp #this will take in a string and it should match and existing user in the database
username_exists?(user_input)


#method that checks if that person's username exists or not 



