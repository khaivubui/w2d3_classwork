require_relative 'board.rb'
class Game
  attr_accessor :board
  def initialize
    @board = Board.new
    @board.populate
  end

  def get_move
    puts 'Please choose a start and end position (eg 0,1)'
    input = gets.chomp.split(",")
  end

  def play
    until @board.won?
      @board.move_piece(get_move) 
    end
  end


end
