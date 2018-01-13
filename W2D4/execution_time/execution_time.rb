require 'byebug'

#phase 1
def my_min1(array)
  array.each_with_index do |el1, i1|
    smallest = true
    array[i1..-1].each do |el2|
      smallest = false if el2 < el1
    end
    return el1 if smallest
  end
end
# n^2

#phase 2
def my_min2(array)
  min = array.first
  array[1..-1].each do |el|
    min = el if el < min
  end
  min
end
# linear


# Largest Contiguous Sub-sum

# n^2
def largest_contiguous_subsum(array)
  #subarrays
  subarrays = []
  array.length.times do |start_idx|
    (start_idx...array.length).each do |end_idx|
      subarrays << array[start_idx..end_idx]
    end
  end

  sums_array = []
  subarrays.each do |subarray|
    sums_array << subarray.inject(:+)
  end

  sums_array.max
end

# list = [5, 3, -7]
# largest_contiguous_subsum(list)

#phase 2 lcs
def lcs(array)
  max = array[0]
  current = array[0]
  array[1..-1].each do |el|
    if (current + el) >= 0
      current += el
      max = current if current > max
    else
      current = el
      max = current if current > max
      current = 0
    end
  end
  max
end

list = [2, 3, -6, 7, -6, 7]
p lcs(list)
