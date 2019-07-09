class Stock < ActiveRecord::Base

    has_many :users_stocks# ActiveRecord....I have no idea what is happening here
    has_many :users, through: :users_stocks# ActiveRecord....I have no idea what is happening here


end
