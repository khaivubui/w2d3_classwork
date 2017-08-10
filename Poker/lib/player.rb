class Player
  attr_reader :name
  attr_accessor :pot, :hand

  def initialize(name, pot, hand)
    @name = name
    @pot = pot
    @hand = hand
  end

  def discard
    
  end
end
