require 'deck'

describe Deck do
  subject(:newdeck) {Deck.new}
  context '#initialize' do

    it 'creates an array of 52 cards' do
      expect(newdeck.cards.count).to eq(52)
    end

    it 'has no duplicate cards' do
      expect(newdeck.cards.uniq).to match(newdeck.cards)
    end
  end

  context 'shuffle' do
    it 'shuffles the deck array' do
      shuffled = newdeck.dup.shuffle
      expect(shuffled).to_not eq(newdeck)
    end
  end

  context 'deal' do
    it 'deals (returns) 5 cards' do
      hand = newdeck.deal
      expect(hand.count).to eq(5)
    end

    # it 'removes dealt cards from the deck' do
    #   expect do
    #     newdeck.deal
    #   end.to change {newdeck.cards.count}.by -5
    # end
  end

  context 'take' do
    it 'takes n cards from deck'
    it 'raises an error if not enough cards'
  end

  context 'return' do
    it 'adds the returned cards to the back of the deck'
  end

end
