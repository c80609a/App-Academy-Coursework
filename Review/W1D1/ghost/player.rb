class Player
    attr_accessor :name

    def initialize(name)
        @name = name
    end

    def guess(fragment)
        prompt(fragment)
        gets.chomp.downcase
    end

    def alert_invalid_guess(letter)
        puts "#{letter} is not a valid move."
        puts "Your guess must be a letter of the alphabet and form the beginning of a valid word."
    end

    def prompt(fragment)
        puts "Hello #{@name}"
        puts "The current fragment is '#{fragment}'."
        print "Add a letter: "
    end

end