def return_stock_tickers
    Stock.all.each do |stock|
        puts stock.ticker
    end 
end 





