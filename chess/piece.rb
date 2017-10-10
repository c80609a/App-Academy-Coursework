require_relative 'modules.rb'
require 'singleton'

class Piece
  attr_accessor :pos

  def initialize(pos = nil, symbol = :nil)
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

  def valid_moves()

  end

  private
  def move_into_check(to_pos)

  end
end

class King < Piece
  include Stepable

  def initialize(pos)
    super(pos, :K)
  end

end

class Knight < Piece

  include Stepable
  def initialize(pos)
    super(pos, :N)
  end

end

class Pawn < Piece

  def initialize(pos)
    super(pos, :P)
  end

end

class Bishop < Piece
  include Slideable
  def initialize(pos)
    super(pos, :B)
  end

end

class Rook < Piece
  include Slideable
  def initialize(pos)
    super(pos, :R)
  end

end

class Queen < Piece
  include Slideable
  def initialize(pos)
    super(pos, :Q)
  end

end
#
class NullPiece < Piece
  include Singleton

  def initialize
    super
  end
end
