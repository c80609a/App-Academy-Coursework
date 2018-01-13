def naive(array, win_size)
  arrays = []
  i = 0
  while i + (win_size - 1) < array.length
    arrays << array[i...i + win_size]
    i += 1
  end

  max = arrays[0].max - arrays[0].min
  arrays[1..-1].each do |el|
    current_diff = el.max - el.min
    max = current_diff if current_diff > max
  end
  max
end

p naive([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p naive([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p naive([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p naive([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
