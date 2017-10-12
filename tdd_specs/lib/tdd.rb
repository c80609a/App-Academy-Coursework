
def my_uniq(array)
  uniq = []
  array.each do |el|
    uniq += [el] unless uniq.include?(el)
  end
  uniq
end

def two_sum(array)
  pairs = []
  (0...(array.length - 1)).each do |start_idx|
    (1...array.length).each do |end_idx|
      if array[start_idx] + array[end_idx] == 0 && array[start_idx] != 0
        pairs << [start_idx, end_idx]
      end
    end
  end
  pairs
end

def my_transpose(array)

  size = array[0].length
  transposed = Array.new(size) { Array.new [] }
  size.times do |x|
    size.times do |y|
      transposed[y][x] = array[x][y]
    end
  end
  transposed
end
