require_relative "piece.rb"

class Board

    #CLASS METHOD (in UML as instance method)
   def self.valid_pos?(pos) #pos example: [2,8]
       pos.none?{|i| i > 7 || i < 0}
   end

   def initialize() #2D array
      @sentinel = NullPiece.instance #(do we use .new for a singleton class?)
      @rows = Array.new(8) {Array.new(8, @sentinel)} #empty 2D array, nil placeholders
      self.place_pieces #puts placeholder Piece instances
   end

   def place_pieces
      #PLACE ROOKS :R
      @rows[0, 0], @rows[0, 7] = Rook.new(:black, self, [0,0]), Rook.new([0,7])
      @rows[7, 0], @rows[7, 7] = Rook.new(:white, self, [7,0]), Rook.new(:white, self, [7,7])
      
      #PLACE KNIGHTS :N
      @rows[0, 1], @rows[0, 6] = Knight.new(:black, self, [0,1]), Knight.new(:black, self, [0,6])
      @rows[7, 1], @rows[7, 6] = Knight.new(:white, self, [7,1]), Knight.new(:white, self, [7,6])
      
      #PLACE BISHOPS :B
      @rows[0,2], @rows[0, 5] = Bishop.new(:black, self, [0,2]), Bishop.new(:black, self, [0,5])
      @rows[7, 2], @rows[7, 5] = Bishop.new(:white, self, [7,2]), Bishop.new(:white, self, [7,5])
       
      #PLACE QUEENS :Q
      @rows[0,3] = Queen.new(:black, self, [0,3])
      @rows[7,3] = Queen.new(:white, self, [7,3])
      
      #PLACE KINGS :K
      @rows[0,4] = King.new(:black, self, [0,4])
      @rows[7,4] = King.new(:black,self, [7,4])
      
      #PLACE PAWNS :P 
      @rows[1].map_with_index! do {|ele, i| ele = Pawn.new(:black, self,[1,i])}
      @rows[6].map_with_index! do {|ele, i| ele = Pawn.new(:white, self,[6,i])}
   end


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