module Stepable
# constants and methods
  KNIGHTDIFFS = [[2, 1],[2, -1],[-2, 1],[-2, -1],[1, 2],[1, -2],[-1, 2],[-1, -2]]
  DIAGONALS = [[1,1],[1,-1],[-1,1],[-1,-1]]
  STRAIGHTS = [[0,1],[0,-1],[1,0],[-1,0]]
  def moves()
  end

  private
  def move_diffs()
  end

end

module Slideable
  DIAGONALS = [[1,1],[1,-1],[-1,1],[-1,-1]]
  STRAIGHTS = [[0,1],[0,-1],[1,0],[-1,0]]

  def moves()
  end

  private
  def move_dirs()
  end

  def horizontal_dirs()
  end

  def diagonal_dirs()
  end

  def grow_unblocked_moves_in_dir(dx, dy)
  end

end
