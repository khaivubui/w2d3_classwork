require 'deck'

describe Deck do
  subject(:deck) {Deck.new}
  describe '#initialize' do
    it 'creates 52 cards' do
      expect(deck.cards).to be_a(Array)
      expect(deck.cards.length).to eq(0)
    end
  end

  describe '#populate' do
    before(:each) do
      deck.populate
    end
    it 'Populates the deck with 52 cards' do
      expect(deck.cards.length).to eq(52)
    end
    it 'Populates the deck with 4 Kings' do
      expect(deck.cards.count do |card|
        card.value == 13
      end).to eq(4)
    end
    it 'Populates the deck with 13 Diamonds' do
      expect(deck.cards.count do
        |card| card.suit == :diamonds
      end).to eq(13)
    end
  end



end
