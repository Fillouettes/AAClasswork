require "singleton"

class Piece

    attr_reader :color, :board
    attr_accessor :pos

    #needs to track position (getter and setter)
   def initialize(color, board, pos) #piece type
        @color = color
        @board = board
        @pos = pos
   end

   def valid_moves
    #moves = [ ] returns array of places piece can move to (depends on piece type due to overwritten .move_dirs)
     # TA says this takes from our subclass moves array ("Rook can't go diagonal")
        self.moves
   end

   def inspect
        self.symbol #.inspect
   end

end

class NullPiece < Piece
    include Singleton #singleton piece: How do we store position on board, if board contains /copies/ of one piece?
                        #not copies, just references, so each pos we reassign with reference to Null if we've moved a piece and now its empty
                        #but our piece contains it's own position, does it not?
                        #what if nullpiece contains a 2d array of all positions it is at, instead of a 1d position, like other pieces? Or it could default return an empty array?
                        # >>looking at pos=(val) method under Piece, looks like this may be relevant if we try to make pos hold a 2D array
                        
                        #interesting...our Piece call will need a 2D array too since it contains 
                        #all the sub-pieces positions then? (rook pos, knight pos, players 1 and 2 positions per real piece...)
                        #if our Null & regularPiece classes hold their positions on board? 
    attr_reader :color, :symbol #UML has no color getter?

    def initialize
        @color = :none
        @symbol = " "
    end

    def moves
        return nil
    end
end

require_relative "./sliding_pieces.rb"
require_relative "./stepping_pieces.rb"
require_relative "pawn"

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
