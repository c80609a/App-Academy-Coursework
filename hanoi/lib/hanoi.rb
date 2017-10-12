
class Hanoi
  attr_reader :towers

  def initialize()
    @towers = [[3, 2, 1], [0], [0]]
  end

  def play
    render
    until won?

      puts "Enter your starting and moving-to towers (from, to)"
      input = gets.chomp.split(",").each(&:to_i)
      from, to = input
      if valid_move?(from, to)
        move(from, to)
        render
      else
        render
        puts "Invalid move, try again"
      end
    end
    puts "You win!"
  end

  def render
    system('clear')
    puts 'Tower 0: ' + @towers[0].join(" ") + "/n" +
          'Tower 1: ' + @towers[1].join(" ") + "/n" +
          'Tower 2: ' + @towers[2].join(" ") + "/n"
  end

  def won?
    tower2 = @towers[1]
    tower3 = @towers[2]
    solution = [3, 2, 1]
    return true if tower2 == solution || tower3 == solution
    false
  end

  def valid_move?(from, to)
  end

  def move(from, to)
  end

end
