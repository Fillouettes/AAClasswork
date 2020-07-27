require 'byebug'
require_relative "./beccaburten_justincho_polytreenode.rb" 

class KnightPathFinder # find shortest path from a starting position to an end position
        
    def initialize(start_pos)
        @root_node = Pos.new(start_pos) #initial position of knight [i,j]
        # self.build_move_tree #placeholder
        @considered_positions = [start_pos]
    end


    def self.valid_moves(pos) #8 POSSIBLE VALID MOVES => 2D array with positions
        x,y = pos #[3,4]
        a = [x+2, y+1] 
        b = [x-2, y+1]
        c = [x+2, y-1]
        d = [x-2, y-1]
        e = [x+1, y+2] 
        f = [x-1, y+2]
        g = [x-1, y-2] 
        h = [x+1, y-2]
        valid_moves = [a, b, c, d, e, f, g, h]
        if valid_moves.nil?
            debugger
        end
        selected = valid_moves.select! { |pos| pos.none? { |i| i < 0 || i > 7 }}
        if selected.nil?
            return valid_moves 
        else 
            selected
        end
    end

    def new_move_positions(pos)
       new_moves = KnightPathFinder.valid_moves(pos)
       new_moves.select! {|move| !@considered_positions.include?(move)}
        # ^ calls self.valid_moves, filters out positions in @considered_positions
       @considered_positions += new_moves
        # ^ add remaining new positions: @considered_positions 
       new_moves
        # ^ return these new positions as a 2D Array
    end


    def build_move_tree #total of 64 nodes, max 8 children per node
    #   moves = self.new_move_positions(@root_node.value)
        # debugger
        queue = [@root_node] #queue will add children of the new nodes we make, 
                             #and then we shift them off and add their children
        until queue.empty? #make a buncha children for our @root_node instance
            current_node = queue.shift
            children = self.new_move_positions(current_node.value) #creates 2D position array
            children.each do |child_pos| 
                child = Pos.new(child_pos)
                child.parent = current_node
                queue << child
            end
        end
        @root_node
    end

    def find_path(end_pos) # [4,2]shortest path to any position from original start_pos
       target_node = @root_node.bfs(end_pos) #bfs return: node instance of end(pos)
       path = trace_path_back(target_node)# Pos.new([4,2])call trace_path_back(target_node) and return path
       path.reverse.map! {|pos_inst| pos_inst.value}
    end

    def trace_path_back(target_node) #[[0, 0]] /////////// [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]  
        #ITERATIVE:
        # path = [target_node] 
        # until path.first.parent.nil? 
        #     path.unshift(path.first.parent)
        # end
        # return path
        #RECURSIVE:
        path = [target_node]
        return path if target_node.parent == nil #[0, 0]
        path += trace_path_back(target_node.parent)  #[[Pos7,6], [Pos5, 5]], Pos[0, 0]]
        path
    end

end

kpf = KnightPathFinder.new([0,0])
#p kpf.new_move_positions([2,1])
kpf.build_move_tree

p kpf.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]

p kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]

    #    0 1 2 3 4 5 6 7
    # 0 [0,1,2,3,4,5,6,7]
    # 1 [0,1,2,3,4,5,6,7]
    # 2 [0,1,2,3,4,5,6,7]
    # 3 [0,1,2,3,4,5,6,7]
    # 4 [0,1,2,3,4,5,6,7]
    # 5 [0,1,2,3,4,5,6,7]
    # 6 [0,X,2,3,4,5,6,7]
    # 7 [0,1,2,3,4,5,6,7]

# Pos.new(start_pos)

# some kind of math that generates children per position

# knightpathfinder.start_pos = move_tree ROOT ==> 

# each node will be a position on the board
# children nodes will be possible positions we can go to from self
# move_tree.val ==> [pos,pos]

# move tree ==> You will want to build on your Pos work, 
# using Pos instances to represent each position.

#8x8 chess board
#kpf = KnightPathFinder.new([0, 0])
# kpf.find_path([2, 1]) # => [[0, 0], [2, 1]]
# kpf.find_path([3, 3]) # => [[0, 0], [2, 1], [3, 3]]

#maybe? can this be done...dare I say...recursively???!
# return target_node if target_node.parent == nil #[[2,1]]
#    path = [target_node.parent] #  [Pos.new([2,1])]             # array [target'sparent]
#    path << trace_path_back(path.last)
#    path 

   #trace back from the node to the root using PolyTreeNode#parent
        #return the values in order from the start position to the end position
        # 2D ARRAY
        # target_node has a parent --> shovel parent into array <<
        # we get that parent --> call parent on it, shovel in array
        # --> we keep going until parent returns nil --> that's our root!
