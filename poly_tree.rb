"let's grow a tree"

class PolyTreeNode


    def initialize( value)
        @value=value
        @parent=nil
        @children=[]
    end

    def parent
        @parent
    end

    def children
        @children
    end

    def value
        @value
    end

    def parent=(new_parent)
        parent.children.delete(self) if parent != nil
            
        @parent=new_parent

        new_parent.children<<self if new_parent != nil
    end

    def inspect
        h = Hash.new 
        h[:value] = value
        h[:children] = children.map { |child| child.value }
        h[:parent] = parent
        h.inspect
    end

    def add_child(child_node)
        children << child_node
    end

    def remove_child(child_node)
        children.delete(child_node)
    end

    def dfs(target_value)
        return self if self.value == target_value
        self.children.each do |child|
            child.dfs(target_value)
        end
        return nil if self.children.empty?
    end
     
end



n1 = PolyTreeNode.new("root1")
n2 = PolyTreeNode.new("root2")
n3 = PolyTreeNode.new("root3")

# connect n3 to n1
n3.parent = n1
# connect n3 to n2
n3.parent = n2

# this should work
p raise "Bad parent=!" unless n3.parent == n2
p raise "Bad parent=!" unless n2.children == [n3]

# this probably doesn't
p raise "Bad parent=!" unless n1.children == []