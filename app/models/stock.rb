class Stock < ActiveRecord::Base

    has_many :users_stocks
    has_many :users, through: :users_stocks


end
