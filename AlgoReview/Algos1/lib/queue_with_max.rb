# Implement a queue with #enqueue and #dequeue, as well as a #max API,
# a method which returns the maximum element still in the queue. This
# is trivial to do by spending O(n) time upon dequeuing.
# Can you do it in O(1) amortized? Maybe use an auxiliary storage structure?

# Use your RingBuffer to achieve optimal shifts! Write any additional
# methods you need.

require_relative 'ring_buffer'

class QueueWithMax
  attr_reader :store, :mq

  def initialize
    @store = RingBuffer.new
    @mq = RingBuffer.new
  end

  def enqueue(val)
    @store.push(val)
    update_mq(val)
  end

  def dequeue
    val = @store.shift
    @mq.shift if mq[0] == val
    val
  end

  def max
    @mq[0] if @mq.length > 0
  end

  def length
    @store.length
  end

  def update_mq(val)
    while @mq[0] && @mq[@mq.length - 1] < val
      @mq.pop
    end
    @mq.push(val)
  end

end
