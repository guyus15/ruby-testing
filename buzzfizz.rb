#BuzzFizz

print "Enter the number to BuzzFizz to: "
input = gets.chomp.to_i

1.upto(input) do |current_num|
    if(current_num % 5 ==0 && current_num % 7 ==0)
        puts "BuzzFizz!"
    elsif(current_num % 5 == 0)
        puts "Buzz"
    elsif(current_num % 7 ==0)
        puts "Fizz"
    else
        puts current_num
    end
end