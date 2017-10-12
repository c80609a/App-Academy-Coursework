class Card
  SUITS = { :clubs => "♣", :diamonds => "♦", :hearts => "♥", :spades => "♠" }.freeze
  VALUES = {
          :two => "2",
          :three => "3",
          :four => "4",
          :five => "5",
          :six => "6",
          :seven => "7",
          :eight => "8",
          :nine => "9",
          :ten => "10",
          :jack => "J",
          :queen => "Q",
          :king => "K",
          :ace => "A"
        }.freeze

  attr_reader :suit, :face_value

  def initialize(val, suit)
    raise ArgumentError unless SUITS.keys.include?(suit)
    raise ArgumentError unless VALUES.keys.include?(val)
    @face_value = val
    @suit = suit

  end

  def to_s
    VALUES[face_value] + SUITS[suit]
  end

  def ==(other_card)
    (other_card.suit == self.suit) && (other_card.face_value == self.face_value)
  end

  def <=>(other_card)
    if self == other_card
      0
    elsif face_value != other_card.face_value
      Card.values.index(self.face_value) <=> Card.values.index(other_card.face_value)
    elsif suit != other_card.suit
      Card.suits.index(self.suit) <=> Card.suits.index(other_card.suit)
    end
  end



  def self.suits
    #ordered array of suits by rank
    SUITS.keys
  end

  def self.royal_values
    #ordered array of the royal values
    VALUES.keys[-5..-1]
  end

  def self.values
    #ordered array of all face values
    VALUES.keys
  end



end
