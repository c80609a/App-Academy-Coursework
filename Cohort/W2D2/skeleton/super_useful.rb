# PHASE 2


def convert_to_int(str)
  begin
  num = Integer(str)
rescue ArgumentError
    p "Argument passed was not string"
  ensure
    num ||= nil
  end
  num

end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

class CoffeeError < StandardError
  def message
    p "COFFEE"
  end
end

class NotAFruitError < StandardError
  def message
    p "That wasn't fruit OR coffee! Laterrrr"
  end
end

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == "coffee"
    raise CoffeeError
  else
    raise NotAFruitError
  end
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"
  begin
  puts "Feed me a fruit! (Enter the name of a fruit:)"
  maybe_fruit = gets.chomp
  reaction(maybe_fruit)
  rescue CoffeeError => e
    e.message
    retry
  rescue NotAFruitError => e
    e.message
  end
end

# PHASE 4

class TimeError < ArgumentError
  def message
    p "We haven't even been friends for 5 years!"
  end
end

class FriendError < TypeError
  def message
    p "You don't even know my name!"
  end
end

class HobbyError < TypeError
  def message
    p "You don't even know what I like to do!"
  end
end


class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    if yrs_known < 5
      raise TimeError
    elsif name.length <= 0
      raise FriendError
    elsif fav_pastime.length <= 0
      raise HobbyError
    end
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me."
  end
end
