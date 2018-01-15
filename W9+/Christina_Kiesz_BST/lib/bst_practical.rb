
def kth_largest(tree_node, k)
  temp = BinarySearchTree.new
  temp.root = tree_node
  arr = temp.in_order_traversal
  return nil if k > arr.length
  temp.find(arr[-k])

end
