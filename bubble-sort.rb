numbers = [10,100,8,89,6,5,4,12,2,1,2,34,5,6,76,7,8,9,10,23,34,32,5,6,5,3,2,3,4,6,4,3,2]

def bubble_sort(data)
    sort=true
    numSorts = 0

    while sort
        sort=false
        data.each_with_index do |number, index|
            if index < data.length - 1
                if data[index] > data[index+1]
                    tempNum = data[index]
                    data[index] = data[index+1]
                    data[index+1] = tempNum
                    sort=true
                end
            end
        end
        numSorts += 1
    end
    puts "Completed in #{numSorts} sorts."
    return data
end

print bubble_sort(numbers)