require_relative 'modules.rb'
require 'singleton'

class Piece
  attr_accessor :pos

  def initialize(pos = nil, symbol = :" ", board = nil)
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

  def initialize(pos, symbol, board)
    super(pos, :K, board)
  end

end

class Knight < Piece

  include Stepable
  def initialize(pos, symbol, board)
    super(pos, :N, board)
  end

end

class Pawn < Piece

  def initialize(pos, symbol, board)
    super(pos, :P, board)
  end

end

class Bishop < Piece
  include Slideable
  def initialize(pos, symbol, board)
    super(pos, :B, board)
  end

end

class Rook < Piece
  include Slideable
  def initialize(pos, symbol, board)
    super(pos, :R, board)
  end

end

class Queen < Piece
  include Slideable
  def initialize(pos, symbol, board)
    super(pos, :Q, board)
  end

end

class NullPiece
  include Singleton

  def initialize
    super
    @symbol = :ME
  end

end
