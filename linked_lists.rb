class LinkedList
    def initialize(value=nil)
        @head = Node.new(value,nil)
    end

    def append(value)
        current_node = @head
        until current_node.next == nil
            current_node = current_node.next
        end
        current_node.next = Node.new(value,nil)
    end
    def prepend(value)
        @head = Node.new(value,@head)
    end
    def size
        counter = 0
        current_node = @head
        until current_node.next == nil
            current_node = current_node.next
            counter += 1
        end
        return counter
    end
    def head
        return @head
    end
    def tail
        current_node = @head
        until current_node.next == nil
            current_node = current_node.next
        end
        return current_node
    end
    def at(index)
    
    end
    def pop
        prev_node = nil
        current_node = @head
        until current_node.next == nil
            prev_node = current_node
            current_node = current_node.next
        end
        prev_node.next = nil
        return current_node
    end
    def contains?(value)
        found = false
        current_node = @head
        until current_node.next == nil || current_node.value == value
            current_node = current_node.next
        end
        current_node.value == value ? found = true : found = false
    end
    def find(value)
        index = 0

        current_node = @head
        until current_node.next == nil || current_node.value == value
            index += 1
            current_node = current_node.next
        end

        current_node.value == value ? index : -1
    end
    def to_s
        list_string = ""
        current_node = @head
        until current_node.next == nil
            current_node = current_node.next
            list_string.concat(current_node.value.to_s + " ")
        end
        
        return list_string
    end

    def return_list
        elements = []
        current_node = @head
        while current_node.next != nil
            elements << current_node
            current_node = current_node.next
        end
        return elements
    end
end

class Node
    attr_accessor :value, :next

    def initialize(value=nil, next_node=nil)
        @value = value
        @next = next_node
    end
end

list = LinkedList.new
list.append(5)
list.append(7)
list.append(4)
list.append(7)
list.append(11)

puts list.contains?(5)