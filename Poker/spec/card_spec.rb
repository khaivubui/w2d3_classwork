require 'card'

describe Card do
  subject(:card) { Card.new(10, :hearts) }
  let(:cardsuit) {Card.new(13, :spades)}

  describe '#initialize' do
    it "has a value" do
      expect(card.value).to eq(10)
    end

    it "has a suit" do
      expect(card.suit).to eq(:hearts)
    end

    it "starts hidden" do
      expect(card.hidden).to be true
    end
  end

  describe '#reveal' do
    it "changes the value of hidden" do
      card.reveal
      expect(card.hidden).to be false
    end
  end

  describe '#to_s' do
    it "returns the card as a string" do
      expect(card.to_s).to eq('10 of hearts')
      expect(cardsuit.to_s).to eq('King of spades')
    end
  end
end
