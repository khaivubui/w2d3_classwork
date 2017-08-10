require 'game'

describe 'Game' do
  subject(:game){Game.new}
  describe '#initialize' do
    it "Initializes a game with a board" do
      expect(game.board).to be_truthy
    end
  end

  describe '#get_move' do
    it "returns a valid move" do
      gamemove =  game.get_move
      expect(gamemove).to be_a(Array)
      expect(gamemove.length).to eq(2)
    end
  end






end
