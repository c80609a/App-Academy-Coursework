require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  # determine the in-degree of each node
  # collect any nodes with zero in-degrees into queue
  sorted = []
  queue = []

  # first, load in all the vertices that have no in_edges
  vertices.each do |vertex|
    if vertex.in_edges.empty?
      queue.push(vertex)
    end
  end



  # then, work through each, checking the destinations it leads to
  # if you find any that have no other ins except how you got there
  # you can take it and put it in sorted, deleting all of its outs
  until queue.empty?
    # pop from queue
    current_vertex = queue.pop
    puts current_vertex.value

    # remove from graph using destroy, add to sorted

    # check for any neighbors of current that are now in-less
    # if so, they go into queue
    children = []
    current_vertex.out_edges.each do |edge|
      children.push(edge.to_vertex)
      edge.destroy!
    end

    children.each do |vertex|
      puts vertex.in_edges.count
      if vertex.in_edges.empty?
        queue.push(vertex)
      end
    end

    sorted << current_vertex
  end

  # once the queue is empty
  # is graph is empty, we can return list, if not, return []
  if vertices.empty?
    return sorted
  else
    return []
  end
end
