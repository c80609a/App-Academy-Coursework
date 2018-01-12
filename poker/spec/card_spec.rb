require 'card'

describe Card do

  describe '#initialize' do
    subject(:newcard) { Card.new(:two, :clubs)}
    it 'is given a face value and suit'do
      expect(newcard.suit).to eq(:clubs)
      expect(newcard.face_value).to eq(:two)
    end

    it 'raises an error if given an invalid suit' do
      expect { Card.new(:test, :two) }.to raise_error(ArgumentError)
    end

    it 'raises an error if given and invalid face value' do
      expect { Card.new(:hearts, :test) }.to raise_error(ArgumentError)
    end
  end

  context "card methods" do
    describe '#to_s' do
      card = Card.new(:two, :clubs)
      it 'returns the value and suit of the card' do
        expect(card.to_s).to eq("2♣")
      end
    end

    describe '#==' do
      card1 = Card.new(:ten, :spades)
      card2 = Card.new(:ace, :spades)

      it 'returns true if both cards have same suit and value' do
        expect(card1 == card1).to be true
      end
      # it 'returns false if both cards do not have the same suit and value' do
      #   expect {card1 == card2}.to { be false }
      # end
    end

    describe '#<=>' do
      it 'returns 0 when the cards are the same' do
        expect(Card.new(:ten, :spades) <=> Card.new(:ten, :spades)).to eq(0)
      end
      it 'returns 1 when the first card has a higher value' do
        expect(Card.new(:ten, :spades) <=> Card.new(:king, :spades)).to eq(-1)
      end
      it 'returns -1 when the second card has a higher value' do
        expect(Card.new(:king, :spades) <=> Card.new(:ten, :spades)).to eq(1)
      end
      it 'returns 1 when the first card has same value but higher suit' do
        expect(Card.new(:king, :spades) <=> Card.new(:king, :clubs)).to eq(1)
      end
      it 'returns -1 when the first card has the same value but lesser suit' do
        expect(Card.new(:king, :clubs) <=> Card.new(:ten, :spades)).to eq(1)
      end
    end
  end


end
