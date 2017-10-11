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

  def in_bounds(pos)
    x, y = pos
    return false unless (0..7).include?(x) && (0..7).include?(y)
    true
  end

  def move_piece(from_pos, to_pos)
    # will eventually need to check color of piece
    # grid at from_pos becomes null, to_pos becomes piece
    piece = self[from_pos]
    if piece.empty?
      raise BoardError
    end
    self[from_pos] = NullPiece.instance
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
    populate
  end

  def populate
    @grid[0] = back_row(0)
    @grid[1] = pawn_row(1)
    (2..5).each do |i|
      @grid[i] = blank_row(i)
    end
    @grid[6] = pawn_row(6)
    @grid[7] = back_row(7)
  end

  def back_row(row_value)
    royalty =
      [Rook.new([row_value, 0]),
      Knight.new([row_value, 1]),
      Bishop.new([row_value, 2]),
      King.new([row_value, 3]),
      Queen.new([row_value, 4]),
      Bishop.new([row_value, 5]),
      Knight.new([row_value, 6]),
      Rook.new([row_value, 7])]

  end

  def pawn_row(row_value)
    pawns = []

    8.times do |i|
      pawns << Pawn.new([row_value, i])
    end
    pawns
  end

  def blank_row(row_value)
    null = []

    8.times do |i|
      null << NullPiece.instance
    end
    null
  end


end
