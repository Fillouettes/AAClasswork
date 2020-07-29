require_relative "./stepable.rb"

class Knight < Piece
    include Stepable
    
    MOVE_DIFFS = [
         [2, 1], [-2, 1],
         [2, -1], [-2, -1],
         [1, 2], [-1, 2],
         [-1, -2], [1, -2]]

    def symbol
        self.color == :white ? "♘" : "♞"
    end
    
    protected
    def move_diffs
       MOVE_DIFFS
    end
end



class King < Piece
    include Stepable

    MOVE_DIFFS = [
        [0,1], [0,-1], 
        [1,0], [-1,0],
        [1,1], [1,-1],
        [-1,1], [-1,-1]]

    def symbol
        self.color == :white ? "♔" : "♚"
    end

    protected
    def move_diffs
        MOVE_DIFFS
    end

end