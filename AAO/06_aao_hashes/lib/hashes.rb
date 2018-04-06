# EASY

# Define a method that, given a sentence, returns a hash of each of the words as
# keys with their lengths as values. Assume the argument lacks punctuation.
def word_lengths(str)
  hash = {}
  str.split(' ').each {|word| hash[word] = word.length }
  hash
end

# Define a method that, given a hash with integers as values, returns the key
# with the largest value.
def greatest_key_by_val(hash)
  key = nil
  val = hash.values.first
  hash.each do |k,v|
    if v > val
      key = k
      val = v
    end
  end
  key

end

# Define a method that accepts two hashes as arguments: an older inventory and a
# newer one. The method should update keys in the older inventory with values
# from the newer one as well as add new key-value pairs to the older inventory.
# The method should return the older inventory as a result. march = {rubies: 10,
# emeralds: 14, diamonds: 2} april = {emeralds: 27, moonstones: 5}
# update_inventory(march, april) => {rubies: 10, emeralds: 27, diamonds: 2,
# moonstones: 5}
def update_inventory(older, newer)
  newer.each do |k,v|
    older[k] = v
  end
  older
end

# Define a method that, given a word, returns a hash with the letters in the
# word as keys and the frequencies of the letters as values.
def letter_counts(word)
  hash = Hash.new(0)
  word.each_char { |ch| hash[ch] += 1 }
  hash
end

# MEDIUM

# Define a method that, given an array, returns that array without duplicates.
# Use a hash! Don't use the uniq method.
def my_uniq(arr)
  hash = Hash.new(0)
  arr.each { |el| hash[el] = 1 }
  hash.keys
end

# Define a method that, given an array of numbers, returns a hash with "even"
# and "odd" as keys and the frequency of each parity as values.
def evens_and_odds(numbers)
  hash = { even: 0, odd: 0 }
  numbers.each { |num| num % 2 == 0 ? hash[:even] += 1 : hash[:odd] += 1 }
  hash
end

# Define a method that, given a string, returns the most common vowel. If
# there's a tie, return the vowel that occurs earlier in the alphabet. Assume
# all letters are lower case.
def most_common_vowel(string)
  hash = Hash.new(0)
  vowels = "aeiou"
  string.each_char { |ch| hash[ch] += 1 if vowels.include?(ch) }
  max = hash.values.max
  hash.select! {|k,v| v == max }
  hash.keys.sort.first
end

# HARD

# Define a method that, given a hash with keys as student names and values as
# their birthday months (numerically, e.g., 1 corresponds to January), returns
# every combination of students whose birthdays fall in the second half of the
# year (months 7-12). students_with_birthdays = { "Asher" => 6, "Bertie" => 11,
# "Dottie" => 8, "Warren" => 9 }
# fall_and_winter_birthdays(students_with_birthdays) => [ ["Bertie", "Dottie"],
# ["Bertie", "Warren"], ["Dottie", "Warren"] ]
def fall_and_winter_birthdays(students)
  last_half = students.select {|k,v| v > 6 }
  last_half.keys.combination(2)
end

# Define a method that, given an array of specimens, returns the biodiversity
# index as defined by the following formula: number_of_species**2 *
# smallest_population_size / largest_population_size biodiversity_index(["cat",
# "cat", "cat"]) => 1 biodiversity_index(["cat", "leopard-spotted ferret",
# "dog"]) => 9
def biodiversity_index(specimens)
  spec_hash = Hash.new(0)
  specimens.each { |critter| spec_hash[critter] += 1 }
  number_of_species = spec_hash.size
  smallest_population_size = spec_hash.values.min
  largest_population_size = spec_hash.values.max
  number_of_species ** 2 * smallest_population_size /  largest_population_size


end

# Define a method that, given the string of a respectable business sign, returns
# a boolean indicating whether pranksters can make a given vandalized string
# using the available letters. Ignore capitalization and punctuation.
# can_tweak_sign("We're having a yellow ferret sale for a good cause over at the
# pet shop!", "Leopard ferrets forever yo") => true
def can_tweak_sign?(normal_sign, vandalized_sign)
  normal_hash = character_count(normal_sign)
  vand_hash = character_count(vandalized_sign)
  vand_hash.all? { |k,v| normal_hash[k] >= v }
end

def character_count(str)
  hash = Hash.new(0)
  alpha = ("a".."z").to_a
  str.each_char {|ch| hash[ch] += 1 if alpha.include?(ch) }
  hash
end
