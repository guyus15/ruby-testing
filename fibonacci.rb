
def fib(n)
    sequence = []
    n.times do |i|
        if i==0 or i==1
            sequence.push(i)
        else
            sequence.push(sequence[i-2]+ sequence[i-1])
        end
    end
    return sequence
end

def fib_rec(n)
    puts n
    if n==0
        0
    elsif n==1
        1
    else
        fib_rec(n-1) + fib_rec(n-2)
    end

end

p fib_rec(10)