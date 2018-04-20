require_relative 'graph'
require 'byebug'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  # determine the in-degree of each node
  # collect any nodes with zero in-degrees into queue

  sorted = []
  queue = []

  # first, load in all the vertices that have no in_edges
  vertices.each do |vertex|
    queue.push(vertex) if vertex.in_edges.empty?
  end

  # then, work through each, checking the destinations it leads to
  # if you find any that have no other ins except how you got there
  # you can take it and put it in sorted, deleting all of its outs
  # children = Hash.new(0)
  # puts "vertices"
  # vertices.each {|val| puts val.value }
  until queue.empty?
    # take first from the queue FIFO stack
    current_vertex = queue.shift
    sorted << current_vertex

    # remove from graph using destroy, add to sorted
    # check for any neighbors of current that are now in-less
    # if so, they go into queue
    edges_arr = current_vertex.out_edges.dup
    edges_arr.each do |edge|
      queue.push(edge.to_vertex) if edge.to_vertex.in_edges.count <= 1
      edge.destroy!
    end

  end

  # once the queue is empty
  # is graph is empty, we can return list, if not, return []
  if sorted.count == vertices.count
    sorted
  else
    []
  end
end

def topological_sort_tarjan(vertices)
  # loops through each vertex
  # initiating a depth first search that terminates
  # if a) node visited or b) no outgoing edges

  # vertex gets put to result list
  result = []
  visited = Hash.new(0)
  queue = []

  # grab the initial round of vertices like before
  vertices.each do |vertex|
    queue << vertex  if vertex.in_edges.empty?
  end

  # work from queue, but with different rules
  until queue.empty?
    #
  end




end
