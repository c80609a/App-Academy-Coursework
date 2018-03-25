require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    resize! if count == num_buckets
    self[key] << key
    @count += 1
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    self[key].delete(key)
    @count -= 1
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    index = num.hash % num_buckets
    @store[index]
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_count = @count
    old_store = @store.flatten
    @count = 0
    @store = Array.new(old_count * 2) {[]}
    old_store.each {|num| insert(num) }
  end
end
