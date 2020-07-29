require_relative "./stepable.rb"

class King < Piece
    include Stepable

    def symbol
        :K
    end

    protected
end

class Knight < Piece
    include Stepable

     def symbol
        :N #sorry Knight :(
    end

    protected
end