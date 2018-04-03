def echo(str)
  str
end

def shout(str)
  str.upcase
end


def repeat(str, num = 2)
  result = str
  (num-1).times {|i| result += " " + str}
  result
end

def start_of_word(str, num = 1)
  str.slice(0, num)
end

def first_word(str)
  str.split(" ").first
end

def titleize(str)
  smalls = ["a", "an", "and", "the", "or", "over"]

  result = str.split(" ").map.with_index do |word, i|
    if i == 0
      word.capitalize
    elsif smalls.include?(word)
      word
    else
      word.capitalize
    end
  end

  result.join(" ")
end
