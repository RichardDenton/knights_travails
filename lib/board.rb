class Board
  attr_reader :size
  def initialize(size)
    squares = Array.new(size) { Array.new(size) }
    @size = size
  end
end