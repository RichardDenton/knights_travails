require_relative "knight"

# Setup a knight on an 8 x 8 board
knight = Knight.new(8)
knight.knight_moves([0,0], [7,7])