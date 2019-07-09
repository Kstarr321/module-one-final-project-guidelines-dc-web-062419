class User < ActiveRecord::Base

   has_many :users_stocks
   has_many :stocks, through: :users_stocks

end
