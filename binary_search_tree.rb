class Node
    attr_accessor :parent, :value, :left, :right

    def initialize(value=nil, parent)
        @value = value
        @left = nil
        @right = nil
        @parent = parent
    end
end

class Tree
    attr_accessor :data, :root

    def initialize
        @data = nil
        @root = nil
    end

    def build_tree(data)
        data.uniq!
        @root = Node.new(data[0],nil)
        
        data[1..-1].each do |value|
            node = @root
            until node.nil?
                parent = node
                value < node.value ? node = node.left : node = node.right
            end
            new_node = Node.new(value, parent)
            value < parent.value ? parent.left = new_node : parent.right = new_node
        end
    end

    def insert(data)
        node = @root
        until node.nil?
            parent = node
            data < node.value ? node = node.left : node = node.right 
        end
        new_node = Node.new(data,parent)
        data < parent.value ? parent.left = new_node : parent.right = new_node
    end
end

a = [5, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]

tree = Tree.new

tree.build_tree(a)

puts tree.root.left.left.value