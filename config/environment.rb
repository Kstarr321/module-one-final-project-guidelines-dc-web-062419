require 'bundler/setup'
require "sinatra/activerecord"
require 'rest-client'
require 'json'
require 'pry'
Bundler.require

Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}

connection_details = YAML::load(File.open('config/database.yml'))
ActiveRecord::Base.establish_connection(connection_details)
ActiveRecord::Base.logger = nil


#?q=
#API CONNECTION GOES HERE: 
BOOKS = "https://www.googleapis.com/books/v1/volumes?q=finance"

def get_book_info(url)
    response = RestClient.get(url)
    json = JSON.parse(response)
    items = json["items"] # an array of hashes
    
end

# book_arr = get_book_info(BOOKS) 
# def get_authors(arr)
#     vol = arr.select do |hash|
#         hash["volumeInfo"]
#     end 
#     binding.pry
# end 

# get_authors(book_arr)
# book[0]["volumeInfo"]["title"] #"authors" "description" "pageCount" "averageRating" "categories"


#id, title, author, pagecount, price 