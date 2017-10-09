require "piece.rb"

class Board

  attr_accessor :grid

  def initialize
    @grid = make_starting_grid
  end

  def [](pos)

  end

  def []=(pos, piece)

  end

  def dup()

  end

  def move_piece(color, from_pos, to_pos)

  end

  def move_piece!(from_pos, to_pos)

  end

  def checkmate?()

  end

  protected
  def make_starting_grid
    Array.new(8) { Array.new(8) }
  end

  def find_king(color)

  end
end
