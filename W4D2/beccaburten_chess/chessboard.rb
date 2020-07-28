require_relative "piece.rb"

class Board

    #CLASS METHOD (in UML as instance method)
   def self.valid_pos?(pos) #pos example: [2,8]
       pos.none?{|i| i > 7 || i < 0}
   end

   def initialize() #2D array
      @rows = Array.new(8) {Array.new(8)} #empty 2D array, nil placeholders
      @sentinel = NullPiece.instance #(do we use .new for a singleton class?)

      self.place_pieces #puts placeholder Piece instances
   end

   def place_pieces
      @rows.each_with_index do |row, i1|
        # row.each_with_index do |ele, i2| 
        #         @rows[i1][i2] = Piece.new([i1,i2])
         case i1 == n
                        
            when n == 0
               
            when n == 1 
               
            when n == 6
               
            when n == 7

            end
         end
      end
   end

   #rows 0 and 7: 
   #  rook: board[0][0],board[0][7], board[7][0], board[7][7] 
   #  knight: board[0][1], board[0][6], board[7][1], board[7][6]
   #  bishop: bishop[0][2], board[0][5], board[7][2], board[7][5]
   #  queen: board[0][3], board[7][3]
   #  king: board[0][4], board[7][4]
   #  >>board[1] and board[6]: 
   #  pawns: board[1][0..7], board[6][0..7]


   def [](pos) #pos will be [i1, i2]
        i1, i2 = pos
        @rows[i1][i2]
   end

   def []=(pos, piece) #takes in Piece or NullPiece
        i1, i2 = pos
        @rows[i1][i2] = piece
   end

   def move_piece(start_pos, end_pos)
      raise "Invalid position" if !Board.valid_pos?(start_pos) || !Board.valid_pos?(end_pos)
      raise "There is no piece here" if @rows[start_pos].nil? #nil will actually NullPiece
      raise "Invalid end position" if !@rows[end_pos].nil?  #this is totally wrong
        #if pos @end has piece that is opponent's, we CAN go << override later
        #if pos @end has piece that is ours, CANNOT go << override later
        #---> update DESTRUCTION if this move captures a piece. Does the game keep a set of captured pieces?
        #if @end pos is empty, we CAN go <<for now, this is our logic
        #if sliding piece, and other piece is on path, CANNOT go << override later
        #end_pos CANNOT result in putting YOUR king in check 
        
        @rows[end_pos] = @rows[start_pos] 
        @rows[start_pos] = nil #will evenetually be NullPiece
   end



end



#every spot in the grid ALWAYS has a piece instance in it

    #    0 1 2 3 4 5 6 7
    # 0 [0,0,0,0,0,0,0,0] << Piece.new
    # 1 [0,0,0,0,0,0,0,0] << Piece.new
    # 2 [0,0,0,0,0,0,0,0] << nil for now >> NullPiece.new
    # 3 [0,0,0,0,0,0,0,0]
    # 4 [0,0,0,0,0,0,0,0]
    # 5 [0,0,0,0,0,0,0,0]
    # 6 [0,0,0,0,0,0,0,0] <<Piece.new
    # 7 [0,0,0,0,0,0,0,0] <<Piece.new

# note: cursor class is provided, use this
# chance to practice reading their code/API





#Two players: each has 16 pieces:
# eight pawns