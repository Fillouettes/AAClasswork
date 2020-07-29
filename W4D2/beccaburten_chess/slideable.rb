module Slideable  #QUEEN, ROOK, BISHOP
    def horizontal_dirs
         HORIZONTAL_DIRS
         #to generate array of potential horizontal moves from GIVEN position
         #return HORIZONTAL DIRS: [[-1,0], [1,0], [0][-1], [0][1]]
    end

    def diagonal_dirs
        DIAGONAL_DIRS
         #return DIAGONAL DIRS: [-1][-1], [1][1], [1][-1], [-1][1]]
    end

    def moves #WHAT IS SELF? -->instance of piece
        directions = move_dirs #move_dirs is method call
        #call move-dirs, get directions = [[-1][-1], [1,1], [1][-1], [-1][1], [-1,0], [1,0], [0][-1], [0][1]]
        moves = [ ] #all possible pos for piece to land on
        directions.each do |inc| #[1,2]inc = incremental move by row, col
            moves += grow_unblocked_moves_in_dir(*inc) #HELPER method below
        end
        return moves
    end

    private 

    HORIZONTAL_DIRS = [[-1,0], [1,0], [0,-1], [0,1]]
    DIAGONAL_DIRS = [[-1,-1], [1,1], [1,-1], [-1,1]]

    def move_dirs #overwritten by subclass QUEEN
      raise NotImplementedError 
      #return horizontal_dirs + diagonal_dirs: [[-1][-1], [1][1], [1][-1], [-1][1], [-1,0], [1,0], [0][-1], [0][1]]
    end

    #use self.board and a getter
    def grow_unblocked_moves_in_dir(dx,dy)  #dx, dy comes from CONSTANT[idx] [-1,-1]
      path_in_this_direction = []
      next_pos = self.pos #[3,3] + -1,-1 <<<current_pos will be a variable in QUEEN class
      next_pos = [(self.pos[0] + dx), (self.pos[1] + dy)]
      until !@board.valid_pos?(next_pos) #until we fall off board...keep going
         if @board[next_pos].color != self.color && @board[next_pos].color != nil #check! is it a NullPiece or opponent piece?
            #this means its our opponent's piece
            path_in_this_direction << next_pos
            break
         end
         break if @board[next_pos].color == self.color #check if pos has OUR OWN piece, can't move past it
         path_in_this_direction << next_pos 
         next_pos[0] += dx
         next_pos[1] += dy
      end
      return path_in_this_direction #< array of possible moves you can take in one sliding direction until you hit a piece / end of board
    end
end

# class NotImplementedError < StandardError
# end