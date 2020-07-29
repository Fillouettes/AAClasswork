require_relative "./piece.rb"
require_relative"stepable"

class Knight < Piece
    include Stepable
end