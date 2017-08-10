require 'board'

describe "Board" do
  subject(:board) { Board.new }

  describe "#initialize" do
    it "creates an empty board that is an array with 3 sub-arrays" do
      expect(board.grid).to eq([[], [], []])
    end
  end

  describe "#populate" do
    it "sets the initial game state of the board" do
      board.populate
      expect(board.grid).to eq([[3,2,1],[],[]])
    end
  end

  describe "#move_piece" do
    before(:each) do
      board.populate
    end

    it "changes the position of an element on the grid" do
      board.move_piece(0, 2)
      expect(board.grid).to eq([[3,2],[],[1]])
    end

    it "raises an error of trying to move from an empty stack" do
      expect { board.move_piece(1, 2) }.to raise_error("From stack is empty")
    end

    it "raises an error when moving a larger piece on top of a smaller one" do
      board.move_piece(0, 1)
      expect { board.move_piece(0, 1) }.to raise_error("Must place on larger piece")
    end
  end

  describe '#won?' do
    before(:each) do
      board.populate
    end

    it "returns false at start of game " do
      expect(board.won?).to be false
    end

    it "returns true if game is won" do
      board.grid = [[],[],[3, 2, 1]]
      expect(board.won?).to be true
    end
  end

end
