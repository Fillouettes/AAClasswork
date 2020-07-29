require_relative "./piece.rb"

class Pawn < Piece

   def symbol
      self.color == :white ? "♙" : "♟︎"
   end
   protected
end