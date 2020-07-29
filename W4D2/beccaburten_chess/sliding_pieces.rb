require_relative "./slideable.rb"

class Rook < Piece
    include Slideable
    #overwrite valid_moves (use moves?)

    def symbol
        self.color == :white ? "♖" : "♜"
    end

    protected
    def move_dirs
        self.horizontal_dirs
    end

end

class Bishop < Piece
    include Slideable

    def symbol
        self.color == :white ? "♗" : "♝"
    end

    protected
    def move_dirs
        self.diagonal_dirs
    end
end

class Queen < Piece
    include Slideable

    def symbol
      self.color == :white ? "♕" : "♛"
    end
    
   protected
    def move_dirs
      self.horizontal_dirs + self.diagonal_dirs
    end
end