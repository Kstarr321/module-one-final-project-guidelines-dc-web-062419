#OVERVIEW 

    This application is designed to be a simple version of a brokerage account where a user can sign in or create a user ID to use the platform. It offers features very similar to that of a more robust program like a real stock investing account. 

#FEATURES 

  1) User can can create a username that allows them to access the platform OR log into the platform if they already have a username
  2) User can request a list of ALL the stocks offered on the platform
  3) From the stocks list a User can select a stock and purchase it. The relationship between the user and the stock is persisted in the database until otherwise changed by another user-selected event
  4) A user can request to see a list of the stocks that they have purchases 
  5) A user can sell a stock if they own it. The stock is removed from the table in the databse that is in charge of handling the associations between a stock and a user 
  6) A User may also add a new stock to the platform if they do not see the stock listed that they want. The stock is then persisted to the Stock table in the database and can be purchased by ANY user on the platform. 
      - This feature was inspired by a real stock trading platform. Some stocks are listed on diferent exchanges but might not be listed on that platform. Most of the time someone can request that the platform go and request a new data feed be set up to include the ticker symbol/co. that the user would like to purchase. My program represents an abstracted version of this. 
  7) When a user buys or sells a stock it is always reflected in their account when they request to be shown a list of their owned stocks. 
  8) The user has the ability to end the program and see a pretty logo as they logout. 


#SOMETHING I STRUGGLED TO BUILD: 
  Passing the instance of the user who is currently logged in to ALL of my methods got complicated. The user input goes into a method that retrieves that User's actual object which is then used in ALL of my methods going forward. 

#THINGS I LEARNED:
  1) Separation of concerns + helper methods 
  2) How to properly use commands from the rakefile that comes with ActiveRecord
  3) Working with a partner can actually be helpful 

#WHAT I WOULD CHANGE OR ADD:
  1) ALOT 
  2) StockScreener platform that would allow the user to do research on the stocks offered on the platform. They could filter by price or ticker symbol or industry type
  3) The ability for the User to go to a book marketplace that contains books on finance that they could also buy. This would result in another many-to-many relationship where users have many books through users_books and books belong to many users through users_books. 
  4) Actually pull REAL stock data from an API or CSV file and create my ruby objects from that data and persist them in my database. Then my user could interact with real stuff instead of faker data. 
  5)




  
