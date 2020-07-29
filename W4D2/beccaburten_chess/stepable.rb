module Stepable #KING, KNIGHT?

    def moves
        #try each move_diff, with normal move constraints, i.e:
        #you can capture an opponent's piece
        #you can land on a null piece
        #cannot land on your own piece
        #move cannot result in your king being in check
    end

    def move_diffs
        #must be implemented by class
        #simply lists all possible move changes?
        #king move_diffs would look like queen move_dirs, just one step
        #knight move_diffs can hop right over from knight's_travails
    end
end