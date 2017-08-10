require 'player'

describe Player do


  let(:tendiamonds) {double('card', value:10, suit: :diamonds)}
  let(:elevendiamonds) { double('card', value: 11, suit: :diamonds) }
  let(:twelvediamonds)  { double('card', value: 12, suit: :diamonds) }
  let(:thirteendiamonds)  { double('card', value: 13, suit: :diamonds) }
  let(:fourteendiamonds)  { double('card', value: 14, suit: :diamonds) }

  let(:hand) do
    double('hand', cards: [tendiamonds,
                    elevendiamonds,
                    twelvediamonds,
                    thirteendiamonds,
                    fourteendiamonds])
  end

  subject(:player) { Player.new('Tony Stark', 100, hand) }
  describe '#initialize' do
    it "gives player a name" do
      expect(player.name).to eq('Tony Stark')
    end

    it "gives player a pot" do
      expect(player.pot).to eq(100)
    end

    it "gives player a hand" do
      expect(player.hand).to eq(hand)
    end
  end
end
