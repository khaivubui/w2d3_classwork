class Card
  attr_accessor :value, :suit, :hidden

  include Comparable

  NUMBERS = {
    11 => 'Jack',
    12 => 'Queen',
    13 => 'King',
    14 => 'Ace'
  }
  SUITS = [:hearts, :clubs, :diamonds, :spades]

  def initialize(value, suit)
    @value = value # Fixnum
    @suit = suit
    @hidden = true
  end

  def reveal
    @hidden = false
  end

  def to_s
    if value > 10
      "#{NUMBERS[@value]} of #{@suit.to_s}"
    else
      "#{@value.to_s} of #{@suit.to_s}"
    end
  end

  # def <=>(other_card)
  #   self.value <=> other_card.value
  # end
end
