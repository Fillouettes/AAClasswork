 
class PolyTreeNode
    attr_reader :children, :position, :parent
    def initialize(position)
        @position = position 
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

