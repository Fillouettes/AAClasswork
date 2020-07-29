require "colorize"
require_relative "./cursor.rb"
require_relative "./chessboard.rb"

class Display

    def initialize
      @board = Board.new
      @cursor = Cursor.new([0,0], @board)
    end

    #render: cursor's location will be a different color (depending on 'selected' value) red, yellow?
    #colorize only works on strings. Make a to_string method for each piece, or within?
end

d = Display.new

#colorize usage:
#stick on a string, or:
#options hash for background

#Piece to string: piece.symbol.colorize(piece.color)