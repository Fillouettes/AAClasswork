class KnightPathFinder
        
    def initialize(root_node)
        @root_node = root_node #initial position of knight [i,j]
        self.build_move_tree #placeholder
        @considered_positions = [root_node]
    end

    def self.valid_moves(pos) #8 POSSIBLE VALID MOVES => 2D array with positions
        
    end

    def new_move_positions(pos)
       new_moves = self.valid_moves(pos).select {|move| !@considered_positions.include?(move)}
        # ^ calls self.valid_moves, filters out positions in @considered_positions
       @considered_positions += new_moves
        # ^ add remaining new positions: @considered_positions 
       new_moves
        # ^ return these new positions as a 2D Array
    end

    def build_move_tree
        root_node

    end

     def find_path(pos)
    end

end

PolyTreeNode.new(start_pos)

some kind of math that generates children per position

# knightpathfinder.start_pos = move_tree ROOT ==> 

# each node will be a position on the board
# children nodes will be possible positions we can go to from self
# move_tree.val ==> [pos,pos]

# move tree ==> You will want to build on your PolyTreeNode work, 
# using PolyTreeNode instances to represent each position.

#8x8 chess board
#kpf = KnightPathFinder.new([0, 0])
# kpf.find_path([2, 1]) # => [[0, 0], [2, 1]]
# kpf.find_path([3, 3]) # => [[0, 0], [2, 1], [3, 3]]