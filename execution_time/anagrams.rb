#Phase1

class String
  def first_anagram?(string)
    permutations = self.chars.to_a.permutation.map(&:join)
    permutations.include?(string)
  end

  def second_anagram?(string)
    until self.empty?
      char = self[0]
      self.delete!(char)
      string.delete!(char)
      return false if self.length != string.length
    end
    true
  end

  def third_anagram?(string)
    self.chars.sort == string.chars.sort
  end

  def fourth_anagram?(string)
    hash1 = Hash.new(0)
    hash2 = Hash.new(0)

    self.chars.each do |char|
      hash1[char] += 1
    end

    string.chars.each do |char|
      hash2[char] += 1
    end

    hash1 == hash2
  end


  def bonus_fourth_anagram?(string)
    hash1 = Hash.new(0)

    self.chars.each do |char|
      hash1[char] += 1
    end

    string.chars.each do |char|
      hash1[char] -= 1
    end

    hash1.values.all? { |value| value == 0 }
  end




end

p "elvis".fourth_anagram?("lifts")
p "elvis".fourth_anagram?("lives")
