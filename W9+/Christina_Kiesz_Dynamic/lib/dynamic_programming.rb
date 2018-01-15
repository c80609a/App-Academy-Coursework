class DynamicProgramming

  def initialize
    @cache = {}
  end

  def blair_nums(n)
    @cache[1] = 1
    @cache[2] = 2
    return @cache[n] if @cache[n]
    odd = (n-1) * 2 - 1
    @cache[n] = blair_nums(n-2) + blair_nums(n-1) + odd
    return @cache[n]
  end

  def frog_hops_bottom_up(n)
    cache = frog_cache_builder(n)
    return cache[n]
  end

  def frog_cache_builder(n)
    # can jump 1, 2, or 3

    @cache[1] = [[1]]
    @cache[2] = [[1, 1], [2]]
    @cache[3] = [[1 ,1 ,1], [1, 2], [2, 1], [3]]
    return @cache if n <= 3


    (4..n).each do |i|
      (1..3).each do |j|
        @cache[i] = []
        
      end
    end



    @cache
  end

  def frog_hops_top_down(n)

  end

  def frog_hops_top_down_helper(n)

  end

  def super_frog_hops(n, k)

  end

  def knapsack(weights, values, capacity)

  end

  # Helper method for bottom-up implementation
  def knapsack_table(weights, values, capacity)

  end

  def maze_solver(maze, start_pos, end_pos)
  end
end
