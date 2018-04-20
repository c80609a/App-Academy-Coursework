require_relative 'cursor.rb'
require_relative 'board.rb'
require 'byebug'
require 'colorize'


class Display

  def initialize(board = Board.new)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    display_grid = []
    (0..7).each do |x|
      display_grid << get_row(x)
    end
    display_grid.each { |row| puts row.join }
    nil
  end

  def get_row(x)
    row_array = []
    (0..7).each do |y|
      piece = @board[[x,y]].to_s
      # debugger
      if @cursor.cursor_pos[0] == x && @cursor.cursor_pos[1] == y
        piece = piece.colorize( :background => :light_cyan )
      end
      row_array << piece
    end
    row_array
  end

  def test
    20.times do
      system ("clear")
      render
      @cursor.get_input
    end
  end

end

puts "hello dave".colorize(:background => :light_white)
puts "I'm sorry, I can't do that".black.on_light_white
