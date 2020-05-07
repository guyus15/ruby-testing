ary = [6,5,2,3,4,5,6,4,3,2,4,5,6,6,43,3,54,54,56,56,3,23,45,23,4,62,3,46]

def merge_sort(list)
    return list if list.length < 2

    left = list.slice!(0..(list.length/2) - 1)
    right = list

    left = merge_sort(left)
    right = merge_sort(right)

    merge(left,right)
end

def merge(l_list, r_list)
    sorted_list = []

    until l_list.length == 0 || r_list.length ==0
        if l_list[0] <= r_list[0]
            sorted_list << l_list.slice!(0)
        else
            sorted_list << r_list.slice!(0)
        end
    end

    l_list.each {|e| sorted_list << e}
    r_list.each {|e| sorted_list << e}

    sorted_list
end

print merge_sort(ary)