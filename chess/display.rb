require_relative 'cursor.rb'
require 'byebug'

class Display

  def initialize(board)
    @cursor = Cursor.new([0,0], board)
  end

end
