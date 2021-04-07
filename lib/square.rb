class Square
  attr_accessor :parent
  attr_reader :x_coord, :y_coord
  def initialize(x, y, parent = nil)
    @x_coord = x
    @y_coord = y
    @parent = parent
  end
end