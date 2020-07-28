require "singleton"

class Piece

    #needs to track position (getter and setter)
    #needs to reference Board
   def initialize(pos) #piece type

   end

   def moves
    #moves = [ ] returns array of places piece can move to (depends on piece type)
   end

end

class NullPiece < Piece
    include singleton

    attr_reader :color, :symbol #UML has no color getter?

    def initialize
        @color = nil
        @symbol = nil
    end

    def moves
        return nil
    end
end

# start_pos [i1][i2] 
# directions for forward => [i1 +- 1][i2]
# directions sideways => [i1][i2 +- 1] 
# diagonally => [i1 -+ 1][i2 +- 1]



# Sliding pieces (Bishop/Rook/Queen)
# Stepping pieces (Knight/King)
# Null pieces (occupy the 'empty' spaces)
# Pawns (we'll do this class last)

# PAWN >> move_dirs should just be moves

# for piece... Symbol should be capitalized
