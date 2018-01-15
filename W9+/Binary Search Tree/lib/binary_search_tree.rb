# There are many ways to implement these methods, feel free to add arguments 
# to methods as you see fit, or to create helper methods.
require 'bst_node'


class BinarySearchTree
  attr_accessor :root
  
  def initialize
    # root just points to a node
    @root = nil
  end

  def insert(value)
    # set node to root if there is none
    if @root == nil
      @root = BSTNode.new(value)
    else
      place_on_tree(@root, value)
    end
  end

  def find(value, tree_node = @root)
    # if you've got a match, look no further and return it 
    if tree_node.value == value
      return tree_node
    end
    
    # rules say everything to one side or other must always obey greater/less than
    # I choose to put equals to left on insert, so search left here
    if (value <=> tree_node.value) < 1 && tree_node.left
      find(value, tree_node.left)
    elsif (value <=> tree_node.value) == 1 && tree_node.right
      find(value, tree_node.right)
    end
    
  end

  def delete(value)
    
    node = find(value)
    ch_count = child_count(node)
    # should be root and zero children, but testing
    if ch_count == 0 && node.parent == nil
      @root = nil
      node = nil
    elsif ch_count == 0
      # nothing below it
      # check if it is left or right to the parent above it, and cut the ties
      if (value <=> node.parent.value) < 1
        node.parent.left = nil
        node = nil
      elsif (value <=> node.parent.value) == 1
        node.parent.right = nil
        node = nil
      end
    elsif ch_count == 1
      # single child, promote it 
      if node.left
        if (value <=> node.parent.value) < 1
          node.parent.left = node.left
          node.left.parent = node.parent
        else
          node.parent.right = node.left
          node.left.parent = node.parent
        end
      elsif node.right
        if (value <=> node.parent.value) < 1
          node.parent.left = node.right
          node.right.parent = node.parent
        else
          node.parent.right = node.right
          node.right.parent = node.parent
        end
      end
    else
      # two children, its complicated, take left max
      max = maximum(node.left)
      max_ch_count = child_count(max)
      if max_ch_count
        if (value <=> node.parent.value) < 1
          max.parent.right = max.left
          node.parent.left = max
          max.parent = node.parent
          max.right = node.right
          max.left = node.left
        else
          max.parent.right = max.left
          node.parent.right = max
          max.parent = node.parent
          max.right = node.right
          max.left = node.left
        end
      end   
    end
      
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    if tree_node.right == nil
      return tree_node
    else
      maximum(tree_node.right)
    end
  end

  def depth(tree_node = @root)
    # going to have to search left and right for each node
    # seems like keeping track somehow with each recursion would be good
    
    
  end 

  def is_balanced?(tree_node = @root)
  end

  def in_order_traversal(tree_node = @root, arr = [])
  end


  private
  # optional helper methods go here:
  def child_count(node)
    count = 0
    if node.left
      count += 1
    end
    
    if node.right
      count += 1
    end
    count
  end
  

  def place_on_tree(node, value)
    # recursive that calls itself traversing down until appropriate parent node found
    if (value <=> node.value) < 1
      # 0 or 1 means equal or less than, so go left
      if node.left
        # there is already a left, call again on that one
        place_on_tree(node.left, value)
      else
        # less than and nothing here yet, send back item
        new_node = BSTNode.new(value)
        new_node.parent = node
        node.left = new_node
        return new_node
      end
    else
      # it was greater than, so right side ops
      if node.right
        # there is a right, call again on the right child
        place_on_tree(node.right, value)
      else
        # got to one that had room
        new_node = BSTNode.new(value)
        new_node.parent = node
        node.right = new_node
        return new_node
      end
    end
      
  end

end
