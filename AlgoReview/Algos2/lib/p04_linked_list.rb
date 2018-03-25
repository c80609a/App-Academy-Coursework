class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous node to next node
    # and removes self from list.
    before = self.prev if self.prev
    after = self.next if self.next
    before.next = after
    after.prev = before
    self.prev = nil
    self.next = nil
    self
  end
end

class LinkedList
  include Enumerable
  def initialize
    @head = Node.new(:head)
    @tail = Node.new(:tail)
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |node, j| return node if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail && @tail.prev == @head
  end

  def get(key)
    each { |node| return node.val if node.key == key }
  end

  def include?(key)
    any? {|node| node.key == key}
  end

  def append(key, val)
    new_node = Node.new(key, val)
    prev_node = @tail.prev
    prev_node.next = new_node
    new_node.prev = prev_node
    new_node.next = @tail
    @tail.prev = new_node
  end

  def update(key, val)
    each { |node| node.val = val if node.key == key }
  end

  def remove(key)
    each do |node|
      if node.key == key
        node.remove

        return node.val
      end
    end
    nil
  end

  def each(&prc)
    current = @head.next
    until current == @tail
      yield current
      current = current.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, node| acc << "[#{node.key}, #{node.val}]" }.join(", ")
  # end
end
