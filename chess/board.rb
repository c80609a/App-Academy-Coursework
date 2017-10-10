require_relative 'piece.rb'
require 'byebug'

class Board

  attr_accessor :grid

  def initialize
    make_starting_grid
  end

  def [](pos)
    x, y = pos
    grid[x][y]
  end

  def []=(pos, piece)
    x, y = pos
    grid[x][y] = piece
  end

  def move_piece(from_pos, to_pos)
    # will eventually need to check color of piece
    # grid at from_pos becomes null, to_pos becomes piece
    piece = grid[from_pos]
    # if piece.empty?
    #   raise BoardError
    # end
    self[from_pos] = nil
    self[to_pos] = piece
    piece.pos = [to_pos]
  end

  def add_piece(pos, symbol)

    piece = Piece.new(pos, symbol)
    # debugger
    self[pos] = piece
  end




  def make_starting_grid
    @grid = Array.new(8) { Array.new(8) }
  end

end
