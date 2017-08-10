require_relative 'card'

class Deck
  attr_reader :cards
  def initialize()
    @cards = []
  end

  SUITS = [:hearts, :clubs, :diamonds, :spades]

  def populate
    SUITS.each do |suit|
      (2..14).each do |value|
        @cards << Card.new(value, suit)
      end
    end
  end

  # Deck#deal
  # Deck#shuffle
  # Deck#collect_card (when player returns a card)
end
