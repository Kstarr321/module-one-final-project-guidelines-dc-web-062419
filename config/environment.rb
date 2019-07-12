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
    items = json["items"]
    
end

books_hash = get_book_info(BOOKS) # the return value of this is a huge hash 
# book[0]["volumeInfo"]["title"] #"authors" "description" "pageCount" "averageRating" "categories"
def get_categories(book)
end 

get_categories(books_hash)

#id, title, author, pagecount, price 