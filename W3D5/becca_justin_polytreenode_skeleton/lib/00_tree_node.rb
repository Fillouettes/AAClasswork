# Know how to implement a polytree using polytree nodes
# Know how to implement BFS and DFS for your polytree
# Be able to explain the differences between BFS and 
# DFS and when one might be preferred

#TEST EDIT TO COMMIT

require 'byebug'
class PolyTreeNode
    attr_reader :children, :value, :parent
    def initialize(value)
        @value = value 
        @parent = nil #once there is a parent to assign, it will be a PolyTreeNode instance
        @children = []
    end
                            #child1.parent = (root)
    def parent=(new_parent) #new_parent is an instance of Node, or nil
        # debugger 
        @parent.children.delete(self) unless @parent.nil? #WORKS
        @parent = new_parent
        if new_parent.nil? 
            return true    
        else 
            new_parent.children << self if !new_parent.children.include?(self)
            true
        end
        # return nil if self.parent == nil #WORKS
    end

    def add_child(child_inst) #currently on Root root.add_child(child1)
        child_inst.parent = self
    end

    def remove_child(child_inst) # self.children = [child_inst]
        raise "This child is not one of ours, so we can't remove it!" if !self.children.include?(child_inst)
        child_inst.parent = nil
    end

    def dfs(target_value) #recursively!
       return self if self.value == target_value
       self.children.each do |child| 
          search_result = child.dfs(target_value)
          return search_result unless search_result.nil?
       end #=> {A, B, d, C, e, f}
       nil
    end
    
    #  A
    # B C 
    #d  e f
    def bfs(target_value) 
        queue = [self] #=> check to see if self has children, then add
        
        until queue.empty?
            current_node = queue.shift
           if current_node.value == target_value #evaluates to self.value
                return current_node
           else
                queue += current_node.children
           end
        end 
        
        nil
    end
end


        # def bfs take 1
        # queue.select! { |child|  child.children if !child.children.empty? }
        # queue.sort_by! {|child1, child2| child1.children.length > child2.children.length}
        # queue.each {|child| return child if child.value == target_value }

root = PolyTreeNode.new("root")
child1 = PolyTreeNode.new("c2")
child2 = PolyTreeNode.new("c3")

# RSPEC ==> node = ('a'..'g').map { |value| PolyTreeNode.new(value) }

# def make_tree(arr)
#     parent_index = 0 #1
#     arr.each_with_index do |child, index|
#       next if index.zero?
#       child.parent = arr[parent_index]
#       parent_index += 1 if index.even?
#     end
# end

# make_tree(node)


# Root.children = [ {miniroot}.value, {leaf}, {rootjustin}, {leafbecca}]
    # Root.each 
    #     miniroot => [leaf1, leaf2]
    #             leaf1 => >>> nil
    #             leaf2 => maybe we need to return nil
    #     leaf => nil
    #     rootjustin => [cho, chore]
    #             cho => nil
    #             chore = > bingo! target found!!!!


# # connect n3 to n1
# n3.parent = n1
# # connect n3 to n2
# n3.parent = n2

# # this should work
# raise "Bad parent=!" unless n3.parent == n2
# raise "Bad parent=!" unless n2.children == [n3]

# # this probably doesn't
# raise "Bad parent=!" unless n1.children == []