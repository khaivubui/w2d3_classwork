require_relative 'card.rb'
class Hand
  attr_reader :cards

  include Comparable

  def initialize(cards = [])
    @cards = cards
  end

  def receive_card(card)
    @cards << card
  end

  # HAND_RANKS = {
  #   royal_flush: 1,
  #   straight_flush: 2,
  #   four_of_a_kind: 3,
  # }

  def hand_rank
    return 1 if royal_flush?
    return 2 if straight_flush?
    return 3 if four_of_a_kind?
    return 4 if full_house?
    return 5 if flush?
    return 6 if straight?
    return 7 if three_of_a_kind?
    return 8 if two_pair?
    return 9 if pair?
    10
  end

  def better_than?(other_hand)
    case self.hand_rank <=> other_hand.hand_rank
    when -1
      true
    when 0
      better_high_card?(other_hand)
    when 1
      false
    end
  end

  def better_high_card?(other_hand)
    mybest = @cards.map {|card| card.value}.max
    otherbest = other_hand.cards.map{|card| card.value}.max
    mybest > otherbest
  end

  def pair?
    value_count = value_count
    return true if value_count.any? {|k,v| v > 1 }
    false
  end

  def value_count
    value_count = Hash.new(0)
    @cards.each do |card|
      value_count[card.value] += 1
    end
    value_count
  end

  def suit_count
    suit_count = Hash.new(0)
    @cards.each do |card|
      suit_count[card.suit] += 1
    end
    suit_count
  end

  def pair?
    if value_count.values.any? { |val| val == 2 }
      return true
    end
    false
  end

  def three_of_a_kind?
    if value_count.values.any? { |val| val == 3 }
      return true
    end
    false
  end

  def four_of_a_kind?
    if value_count.values.any? { |val| val == 4 }
      return true
    end
    false
  end

  def two_pair?
    num_val_count = value_count.values.select { |val| val == 2 }
    if num_val_count.size > 1
      return true
    end
    false
  end

  def straight?
    values = @cards.map { |card| card.value }
    in_order_values = (values.min..values.max).to_a
    values.uniq.length == in_order_values.length
  end

  def flush?
    suit_count.values.any? {|count| count == 5 }
  end

  def full_house?
    pair? && three_of_a_kind?
  end

  def straight_flush?
    straight? && flush?
  end

  def royal_flush?
    straight? && flush? &&
    @cards.map { |card| card.value }.min == 10
  end
end
