require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize
    self.store = StaticArray.new(8)
    self.capacity = 8
    self.length = 0
  end

  # O(1)
  def [](index)
    check_index(index)
    self[index]
  end

  # O(1)
  def []=(index, val)
    check_index(index)
    self[index] = val
  end

  # O(1)
  def pop
    raise "index out of bounds" if (length == 0)
    val = self[length -1]

    self[length - 1] = nil
    self.length -= 1

    val
  end

  # O(1) ammortized
  def push(val)
    resize! if length == capacity
    self.length += 1
    self[length - 1] = val

  end

  # O(1)
  def shift
  end

  # O(1) ammortized
  def unshift(val)
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
    raise "index out of bounds" unless index >= 0 && index < length
  end

  def resize!
  end
end
