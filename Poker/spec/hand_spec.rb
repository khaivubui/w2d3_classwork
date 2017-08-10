require 'hand'

describe Hand do
  subject(:hand) {Hand.new}
  let(:ninespades) { double("card", :value => 9, suit: :spades)}
  let(:tenspades) { double('card', value: 10, suit: :spades)}

  let(:twoclubs) { double('card', value: 2, suit: :clubs)}

  let(:threediamonds) { double('card', value: 3, suit: :diamonds)}
  let(:sevendiamonds) { double('card', value: 7, suit: :diamonds) }
  let(:eightdiamonds) { double('card', value: 8, suit: :diamonds) }
  let(:ninediamonds)  { double('card', value: 9, suit: :diamonds) }
  let(:tendiamonds) {double('card', value:10, suit: :diamonds)}
  let(:elevendiamonds) { double('card', value: 11, suit: :diamonds) }
  let(:twelvediamonds)  { double('card', value: 12, suit: :diamonds) }
  let(:thirteendiamonds)  { double('card', value: 13, suit: :diamonds) }
  let(:fourteendiamonds)  { double('card', value: 14, suit: :diamonds) }

  let(:twohearts)  { double('card', value: 2, suit: :hearts) }
  let(:tenhearts) { double('card', value: 10, suit: :hearts)}

  describe '#initialize' do
    it 'Starts with no cards' do
      expect(hand.cards).to be_empty
    end
  end

  describe '#receive_card' do
    it 'adds a card to the hand' do
      hand.receive_card(ninespades)
      expect(hand.cards.length).to eq(1)
    end

    it 'adds the correct card' do
      hand.receive_card(ninespades)
      expect(hand.cards.first.value).to eq(9)
    end

  end



  context 'cardcount' do
    before(:each) do
      cards = [ninespades, tenspades, tenhearts, twoclubs, threediamonds]
      cards.each do |card|
        hand.receive_card(card)
      end
    end

    describe '#value_count' do
      it "counts the number of cards of same value" do
        expect(hand.value_count[10]).to eq(2)
      end
    end

    describe '#suit_count' do
      it "counts the number of cards of same suit" do
        expect(hand.suit_count[:spades]).to eq(2)
      end
    end

    describe '#pair?' do
      it "returns true if there is a pair" do
        expect(hand.pair?).to be true
      end
    end

    describe '#three_of_a_kind?' do
      it "returns true if there is a three of a kind" do
        hand.receive_card(tendiamonds)
        expect(hand.three_of_a_kind?).to be true
      end
    end

    describe '#four_of_a_kind?' do
      it "returns true if there is a four of a kind" do
        hand.receive_card(tendiamonds)
        hand.receive_card(tendiamonds)
        expect(hand.four_of_a_kind?).to be true
      end
    end

    describe '#two_pair?' do
      it "returns ture if there is two pair" do
        hand.receive_card(twoclubs)
        expect(hand.two_pair?).to be true
      end
    end

    describe '#straight?' do
      it "returns true if there is a straight" do
        new_hand = Hand.new([elevendiamonds,
                             eightdiamonds,
                             sevendiamonds,
                             ninespades,
                             tenspades])
        expect(new_hand.straight?).to be true
      end
    end

    describe '#flush?' do
      it 'returns true if there is a flush' do
        new_hand = Hand.new([elevendiamonds,
                             eightdiamonds,
                             sevendiamonds,
                             threediamonds,
                             tendiamonds])
        expect(new_hand.flush?).to be true
      end
    end

    describe '#full_house?' do
      it 'returns true if there is a full house' do
        new_hand = Hand.new([tenspades,
                             tendiamonds,
                             tenhearts,
                             twoclubs,
                             twohearts])
          expect(new_hand.full_house?).to be true
      end
    end

    describe '#straight_flush?' do
      it 'returns true if there is a straight flush' do
        new_hand = Hand.new([ninediamonds,
                             tendiamonds,
                             elevendiamonds,
                             sevendiamonds,
                             eightdiamonds])
          expect(new_hand.straight_flush?).to be true

      end
    end

    describe '#royal_flush?' do
      it 'returns true if there is a royal flush' do
        new_hand = Hand.new([fourteendiamonds,
                             tendiamonds,
                             elevendiamonds,
                             twelvediamonds,
                             thirteendiamonds])
          expect(new_hand.royal_flush?).to be true

      end
    end
  end
  # let(:ninespades) { double("card", :value => 9, suit: :spades)}
  # let(:tenspades) { double('card', value: 10, suit: :spades)}
  # let(:tenhearts) { double('card', value: 10, suit: :hearts)}
  # let(:twoclubs) { double('card', value: 2, suit: :clubs)}
  # let(:threediamonds) { double('card', value: 3, suit: :diamonds)}
  # let(:tendiamonds) {double('card', value:10, suit: :diamonds)}
  # let(:elevendiamonds) { double('card', value: 11, suit: :diamonds) }
  # let(:eightdiamonds) { double('card', value: 8, suit: :diamonds) }
  # let(:sevendiamonds) { double('card', value: 7, suit: :diamonds) }
  # let(:twohearts)  { double('card', value: 2, suit: :hearts) }

 context 'comparecard' do
   describe '#better_than' do
     it 'returns true if other hand high card is lower' do
       my_hand = Hand.new([elevendiamonds,
                            eightdiamonds,
                            sevendiamonds,
                            threediamonds,
                            tendiamonds])
       other_hand = Hand.new([twelvediamonds,
                            eightdiamonds,
                            sevendiamonds,
                            threediamonds,
                            tendiamonds])
      expect(my_hand.better_than?(other_hand)).to be false
    end         

     it 'returns true if other hand is lower ranked ' do
       my_hand = Hand.new([elevendiamonds,
                            eightdiamonds,
                            sevendiamonds,
                            threediamonds,
                            tendiamonds])
       other_hand = Hand.new([elevendiamonds,
                            eightdiamonds,
                            sevendiamonds,
                            ninespades,
                            tenspades])
      expect(my_hand.better_than?(other_hand)).to be true
     end

   end
 end







end
