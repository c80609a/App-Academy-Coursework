require "set"


class GhostGame
    ALPHABET = Set.new("a".."z")
    MAX_LOSS_COUNT = 5

    def initialize(*players)
        words = File.readlines("dictionary.txt").map(&:chomp)
        @dict = Set.new(words)
        @players = players
        @fragment = ""
    end

    def play_round
        game_over = false
        while !game_over
            take_turn
            game_over = is_word?(@fragment)
            next_player!
        end
        puts "Game is over"
        puts 
    end

    def current_player
        @players.first
    end

    def previous_player 
        @players.last
    end

    def next_player!
        @players.push(@players.shift)
    end

    def take_turn
        valid = false
        letter = ""
        while !valid
            letter = current_player.guess(@fragment)
            valid = valid_play?(letter)
            current_player.alert_invalid_guess(letter) if !valid
        end
        @fragment += letter

    end

    def valid_play?(letter)
        return false unless ALPHABET.include?(letter)
        new_frag = @fragment + letter
        @dict.any? { |word| word.start_with?(new_frag)}
    end

    def is_word?(fragment)
        @dict.include?(fragment)
    end
end

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

if $PROGRAM_NAME == __FILE__
  game = GhostGame.new(Player.new("Gizmo"), Player.new("Breakfast"))
  game.play_round
end