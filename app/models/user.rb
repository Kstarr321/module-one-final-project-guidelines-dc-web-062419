class User < ActiveRecord::Base

   has_many :stock_users
   has_many :stocks, through: :stock_users

end
