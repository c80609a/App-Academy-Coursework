def reverser(&prc)
  string = prc.call
  result = string.split(" ").map {|word| word.reverse }
  result.join(" ")
end

def adder(default = 1, &prc)
  default + prc.call
end

def repeater(times = 1, &prc)
  times.times do
    prc.call
  end
end
