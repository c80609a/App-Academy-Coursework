class MyStack
  def initialize
    @store = []
  end

  def pop
    @store.pop
  end

  def push(el)
    @store.push(el)
  end

  def peek
    @store.dup
  end

  def size
    @store.count
  end

  def empty?
    @store.empty?
  end
end
