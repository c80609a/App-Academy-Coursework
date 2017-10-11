require_relative 'modules.rb'
require 'singleton'

class Piece
  attr_accessor :pos

  def initialize(board, pos = nil, symbol = :" " )
    @board = board
    @pos = pos
    @symbol = symbol
  end

  def to_s()
    @symbol.to_s
  end

  def empty?()
    @symbol.nil?
  end

  def symbol()
    @symbol
  end

  def moves()

  end

  private
  def move_into_check(to_pos)

  end
end

class King < Piece
  include Stepable

  def initialize(board, pos)
    super(board, pos, :K)
  end

end

class Knight < Piece

  include Stepable
  def initialize(board, pos)
    super(board, pos, :N)
  end

end

class Pawn < Piece

  def initialize(board, pos)
    super(board, pos, :P)
  end

end

class Bishop < Piece
  include Slideable
  def initialize(board, pos)
    super(board, pos, :B)
  end

end

class Rook < Piece
  include Slideable
  def initialize(board, pos)
    super(board, pos, :R)
  end

end

class Queen < Piece
  include Slideable
  def initialize(board, pos)
    super(board, pos, :Q)
  end

end

class NullPiece < Piece
  include Singleton

  def initialize(board)
    super(board)
  end

end
