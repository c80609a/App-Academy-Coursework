# EASY

# Return the argument with all its lowercase characters removed.
def destructive_uppercase(str)
  alpha = ("a".."z")
  new_str = str.chars.reject { |ch| alpha.include?(ch) }
  new_str.join
end

# Return the middle character of a string. Return the middle two characters if
# the word is of even length, e.g. middle_substring("middle") => "dd",
# middle_substring("mid") => "i"
def middle_substring(str)
  half = str.length / 2
  if (str.length % 2) == 0
    return str[half-1..half]
  else
    return str[half]
  end
end

# Return the number of vowels in a string.
VOWELS = %w(a e i o u)
def num_vowels(str)
  str.chars.count {|ch| VOWELS.include?(ch)}
end

# Return the factoral of the argument (num). A number's factorial is the product
# of all whole numbers between 1 and the number itself. Assume the argument will
# be > 0.
def factorial(num)
  fact = 1
  (2..num).each do |i|
    fact *= i
  end
  fact
end


# MEDIUM

# Write your own version of the join method. separator = "" ensures that the
# default seperator is an empty string.
def my_join(arr, separator = "")
  result = ""
  arr.each { |el| result.concat(el + separator) }
  separator == "" ? result : result.chop
end

# Write a method that converts its argument to weirdcase, where every odd
# character is lowercase and every even is uppercase, e.g.
# weirdcase("weirdcase") => "wEiRdCaSe"
def weirdcase(str)
  new_str = str.chars.map.with_index do |ch, i|
    if i.even? #odd char
      ch.downcase
    else
      ch.upcase
    end
  end

  new_str.join
end

# Reverse all words of five more more letters in a string. Return the resulting
# string, e.g., reverse_five("Looks like my luck has reversed") => "skooL like
# my luck has desrever")
def reverse_five(str)
  arr = str.split(" ")
  arr.map! do |word|
    if word.length >= 5
      word.reverse
    else
      word
    end
  end
  arr.join(" ")
end

# Return an array of integers from 1 to n (inclusive), except for each multiple
# of 3 replace the integer with "fizz", for each multiple of 5 replace the
# integer with "buzz", and for each multiple of both 3 and 5, replace the
# integer with "fizzbuzz".
def fizzbuzz(n)
  arr = (1..n).to_a
  arr.map do |num|
    if num % 3 == 0 && num % 5 == 0
      "fizzbuzz"
    elsif num % 3 == 0
      "fizz"
    elsif num % 5 == 0
      "buzz"
    else
      num
    end
  end
end


# HARD

# Write a method that returns a new array containing all the elements of the
# original array in reverse order.
def my_reverse(arr)
  result = []
  arr.each { |el| result.unshift(el) }
  result
end

# Write a method that returns a boolean indicating whether the argument is
# prime.
def prime?(num)
  return false if num < 2
  (2...num).each { |i| return false if  num % i == 0 }
  true
end

# Write a method that returns a sorted array of the factors of its argument.
def factors(num)
  arr = (1..num).to_a
  arr.select! {|el| num % el == 0 }
  arr

end

# Write a method that returns a sorted array of the prime factors of its argument.
def prime_factors(num)
  arr = factors(num)
  arr.select {|el| prime?(el)}
end

# Write a method that returns the number of prime factors of its argument.
def num_prime_factors(num)
  prime_factors(num).length
end


# EXPERT

# Return the one integer in an array that is even or odd while the rest are of
# opposite parity, e.g. oddball([1,2,3]) => 2, oddball([2,4,5,6] => 5)
def oddball(arr)
  odd = []
  even = []
  arr.each {|el| el.even? ? even << el : odd << el }
  odd.count == 1 ? odd.first : even.first
end
