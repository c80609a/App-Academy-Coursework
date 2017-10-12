require_relative 'card'

class Deck
  attr_reader :cards
  def self.all_cards()
    #returns an array of the suits and values combinations
    Card.suits.product(Card.values).map do |suit, value|
      Card.new(value, suit)
    end
  end

  def initialize(cards = Deck.all_cards)
    @cards = cards
  end

  def shuffle
    @cards.shuffle!
  end

  def deal
    take(5)
  end

  def take(n)
    raise "not enough cards left" if n > @cards.count
    @cards.shift(n)
  end



end
