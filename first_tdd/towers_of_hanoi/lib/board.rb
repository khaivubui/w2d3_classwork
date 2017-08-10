class Board
  attr_accessor :grid
  def initialize
    @grid = Array.new(3) { [] }
  end

  def populate
    @grid[0] = [3,2,1]
  end

  def move_piece(arg)
    from = arg[0]
    to = arg[1]
    raise "From stack is empty" if @grid[from].empty?

    unless @grid[to].empty? ||  @grid[from].last < @grid[to].last
      raise "Must place on larger piece"
    end
    @grid[to] << @grid[from].pop
  end

  def won?
    return true if @grid[1] == [3, 2, 1] || @grid[2] == [3, 2, 1]
    false
  end
end
