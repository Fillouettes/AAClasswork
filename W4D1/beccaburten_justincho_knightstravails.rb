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
        valid_moves.select! { |pos| pos.none? { |i| i < 0 || i > 7 }}
    end

    def new_move_positions(pos)
       new_moves = KnightPathFinder.valid_moves(pos)
       new_moves.select! {|move| !@considered_positions.include?(move)}
        # ^ calls self.valid_moves, filters out positions in @considered_positions
       @considered_positions += new_move
        # ^ add remaining new positions: @considered_positions 
       new_moves
        # ^ return these new positions as a 2D Array
    end


    def build_move_tree #total of 64 nodes, max 8 children per node
    #   moves = self.new_move_positions(@root_node.value)
        # debugger
        queue = [@root_node] #queue will add children of the new nodes we make, and then we shift them off and add their children
        until queue.empty? #make a buncha children for our @root_node instance
            current_node = queue.shift
            children = self.new_move_positions(current_node.value) #creates 2D position array
            children.each do |child_pos| 
                child = Pos.new(child_pos)
                child.parent = @root_node
                queue << child
            end
        end
        @root_node
    end
    # CHECK: load this in pry and then look at root node

end

kpf = KnightPathFinder.new([0,0])
p kpf.new_move_positions([2,1])
# kpf.build_move_tree



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



