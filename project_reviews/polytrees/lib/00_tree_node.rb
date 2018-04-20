class PolyTreeNode
  attr_reader :parent
  attr_accessor :value

  def initialize(value)
    @parent = nil
    @children = []
    @value = value
  end

  def parent
    @parent
  end

  def children
    @children
  end

  def value
    @value
  end

  def parent=(node)
    return if self.parent == node

    if self.parent
      self.parent._children.delete(self)
    end

    @parent = node
    self.parent._children << self unless self.parent.nil?

    self
  end

  def add_child(node)
    node.parent = self
  end

  def remove_child(node)
    raise_error if !self._children.include?(node)
    node.parent = nil
  end

  def dfs(target)
    return self if self.value == target

    self._children.each do |child|
      result = child.dfs(target)
      return result unless result.nil?
    end

    nil
  end

  def bfs(target)
    queue = []
    queue << self

    until queue.empty?
      current_node = queue.shift
      return current_node if current_node.value == target

      current_node._children.each { |child| queue << child }
    end
    nil
  end

  protected
  def _children
    @children
  end

end
