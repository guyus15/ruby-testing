stock_prices = [2.0,3.0,6.0,12.0,11.5,1,9.0,7.5,50,4.5]

def stock_picker(stocks)
    cheapestStock = stocks.first
    expensiveStock = stocks.first

    stocks.each do |stock| 
        cheapestStock = stock if stock < cheapestStock
        expensiveStock = stock if stock > expensiveStock
    end

    puts "Best day to buy stock: Day #{stocks.find_index(cheapestStock)} (£#{cheapestStock})"
    puts "Best day to sell stock: Day #{stocks.find_index(expensiveStock)} (£#{expensiveStock})"
end

stock_picker(stock_prices)