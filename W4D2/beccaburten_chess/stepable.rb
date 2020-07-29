module Stepable #KING, KNIGHT?

    def moves

        directions = move_diffs
        moves = directions.map do |inc|  #incremental pairs
            i1 = self.pos[0] + inc[0]
            i2 = self.pos[1] + inc[1]
            [i1, i2]
        end
        
        moves.select { |pos| #cannot land on your own piece or off the board 
            self.board.valid_pos?(pos) && self.color != self.board[pos].color }  
            #TO DO: move cannot result in your king being in check
    end

    private 
    def move_diffs
      raise NotImplementedError 
        #must be implemented by class
        #simply lists all possible move changes?
        #king move_diffs would look like queen move_dirs, just one step
        #knight move_diffs can hop right over from knight's_travails
    end
end
