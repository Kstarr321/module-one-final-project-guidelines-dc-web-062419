class Stock < ActiveRecord::Base

    has_many :stock_users
    has_many :users, through: :stock_users


end
