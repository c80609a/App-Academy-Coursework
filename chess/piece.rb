require_relative 'modules.rb'

class Piece
  attr_accessor :pos

  def initialize(pos, symbol = nil)
    @pos = pos
    @symbol = symbol
  end

  def to_s()

  end

  def empty?()
    @symbol.nil?
  end

  def symbol()

  end

  def valid_moves()

  end

  private
  def move_into_check(to_pos)

  end
end

# class King < Piece
#   include Stepable
#
#   def initialize(pos)
#     @pos = pos
#     @symbol = :K
#   end
#
#   def symbol()
#
#   end
#
#   protected
#   def  move_diffs()
#
#   end
#
# end
#
# class Knight < Piece
#
#   include Stepable
#   def initialize(pos)
#     @pos = pos
#     @symbol = :N
#   end
#
#   def symbol()
#
#   end
#
#   protected
#   def  move_diffs()
#
#   end
#
# end
#
# class Pawn < Piece
#
#   def initialize(pos)
#     @pos = pos
#     @symbol = :P
#   end
#
#   def symbol()
#
#   end
#
#   def moves()
#
#   end
#
#   protected
#   def at_start_row?()
#
#   end
#
#   def forward_dir()
#
#   end
#
#   def forward_steps()
#
#   end
#
#   def side_attacks()
#
#   end
# end
#
# class Bishop < Piece
#   include Slideable
#   def initialize(pos)
#     @pos = pos
#     @symbol = :B
#   end
#
#   def symbol()
#
#   end
#
#   protected
#   def  move_dirs()
#
#   end
# end
#
# class Rook < Piece
#   include Slideable
#   def initialize(pos)
#     @pos = pos
#     @symbol = :R
#   end
#
#   def symbol()
#
#   end
#
#   protected
#   def  move_dirs()
#
#   end
# end
#
# class Queen < Piece
#   include Slideable
#   def initialize(pos)
#     @pos = pos
#     @symbol = :Q
#   end
#
#   def symbol()
#
#   end
#
#   protected
#   def  move_dirs()
#
#   end
# end
#
# class NullPiece < Piece
#   include Singleton
#
#   def initialize
#     super
#   end
#
#   def moves()
#
#   end
#
# end
