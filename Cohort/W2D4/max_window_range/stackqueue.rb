require_relative 'mystack'


class StackQueue

  def initialize
    @main_stack = MyStack.new
    @holder_stack = MyStack.new
    @max = nil
    @min = nil
  end

  def enqueue(el)
    @max = el if el > @max
    @min = el if el < @min
    @main_stack.push(el)
  end

  def dequeue
    @main_stack.length - 1.times do
      el = @main_stack.pop
      @max = el if el > @max
      @min = el if el < @min
      @holder_stack.push(@main_stack.pop)
    end
    @main_stack.pop

    @holder_stack.length.times do
      @main_stack.push(@holder_stack.pop)
    end
  end


end
