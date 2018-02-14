class DynamicProgramming

  def initialize
    @frog_cache = []
  end

  # def blair_nums(n)
  #   @cache[1] = 1
  #   @cache[2] = 2
  #   return @cache[n] if @cache[n]
  #   odd = (n-1) * 2 - 1
  #   @cache[n] = blair_nums(n-2) + blair_nums(n-1) + odd
  #   return @cache[n]
  # end

## FROGS


  def frog_hops_bottom_up(n)
    cached = frog_cache_builder(n)

    return cached[n]
  end


  def frog_cache_builder(n)
    # can jump 1, 2, or 3
    ways = [[[]], [[1]], [[1, 1], [2]], [[1, 1, 1], [1, 2], [2, 1], [3]]]
    return ways if n < 3

    (4..n).each do |i|
      new_way_set = []
      (1..3).each do |first_hop|
        ways[i - first_hop].each do |way|
          new_way = [first_hop]
          way.each do |hop|
            new_way << hop
          end
          new_way_set << new_way
        end
      end
      ways << new_way_set
    end
    ways
  end

  def frog_hops_top_down(n)
    @frog_cache = [[[]], [[1]], [[1,1], [2]]]
    frog_hops_top_down_helper(n)
  end

  def frog_hops_top_down_helper(n)
    return @frog_cache[n] if @frog_cache[n]
    new_way_set = []
    (1..3).each do |first_step|
      frog_hops_top_down_helper(n - first_step).each do |way|
        new_way = [first_step]
        way.each do |step|
          new_way << step
        end
        new_way_set << new_way
      end
    end
    @frog_cache[n] = new_way_set
  end
  # def frog_hops_top_down(n)
  #   @cache = [[[]], [[1]], [[1,1], [2]]]
  #   frog_hops_top_down_helper(n)
  # end
  #
  # def frog_hops_top_down_helper(n)
  #   return @cache[n] if @cache[n]
  #
  #   new_way_set = []
  #   (1..3).each do |first_hop|
  #     frog_hops_top_down_helper(n - first_hop).each do |way|
  #       new_way = [first_hop]
  #       way.each do |hop|
  #         new_way << hop
  #       end
  #       new_way_set << new_way
  #     end
  #   end
  #   @cache[n] = new_way_set
  # end

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
