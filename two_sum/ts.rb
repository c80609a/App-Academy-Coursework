def bad_two_sum?(array, tar)
  (0...(array.length - 1)).each do |start_idx|
    (1...array.length).each do |end_idx|
      next if start_idx == end_idx
      return true if array[start_idx] + array[end_idx] == tar
    end
  end
  false
end

# arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

def okay_two_sum(array, tar)
  array.sort!
  i1 = 0
  i2 = array.length - 1

  sum = array[i1] + array[i2]

  while i1 != i2
    case sum <=> tar
    when -1
      i1 += 1
      sum = array[i1] + array[i2]
      return false if sum > tar
    when 0
      return true
    when 1
      i2 -= 1
      sum = array[i1] + array[i2]
      return false if sum < tar
    end

  end
  false
end

def two_sum?(array, target)
  hash = Hash.new("cat")
  array.each do |number|
    looking_for = target - number
    if hash.key?(looking_for)
      return true
    else
      hash[number] = "cat"
    end
  end
  false
end
