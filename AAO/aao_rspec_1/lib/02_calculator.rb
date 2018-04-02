def add(num1, num2)
  num1 + num2
end

def subtract(num1, num2)
  num1 - num2
end

def sum(arr)
  sum = 0
  (0...arr.length).each {|i| sum += arr[i]}
  sum
end

def multiply(arr)
  result = arr[0]
  (1...arr.length).each { |i| result *= arr[i] }
  result
end

def power(base, n)
  base ** n
end

def factorial(num)
  return num if num <= 2
  result = 1
  (2..num).each { |i| result *= i }
  result
end
