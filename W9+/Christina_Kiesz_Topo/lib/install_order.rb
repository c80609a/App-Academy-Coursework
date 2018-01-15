# Given an Array of tuples, where tuple[0] represents a package id,
# and tuple[1] represents its dependency, determine the order in which
# the packages should be installed. Only packages that have dependencies
# will be listed, but all packages from 1..max_id exist.

# N.B. this is how `npm` works.

# Import any files you need to
require_relative 'topological_sort'
require_relative 'graph'


def install_order(arr)
  # create dependency Graph
  vertices = {}
  max = arr.flatten.max
  (1..max).each do |i|
    vertices[i] = Vertex.new(i)
  end

  arr.each do |tuple|
    to_v = vertices[tuple[0]]
    from_v = vertices[tuple[1]]
    Edge.new(from_v, to_v)
  end

  verts = vertices.values

  result = topological_sort(verts).map { |e| e.value  }

  result


end
