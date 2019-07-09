class StockUser < ActiveRecord::Base

    belongs_to :users 
    belongs_to :stocks 


end
