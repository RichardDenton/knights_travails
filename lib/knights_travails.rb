require_relative "knight"

# Setup a knight on an 8 x 8 board
@size = 8
knight = Knight.new(@size)

def get_positions
  puts "Welcome to Knight's travails!"
  puts
  start_x = get_coordinate("start", "x")
  start_y = get_coordinate("start", "y")
  target_x = get_coordinate("target", "x")
  target_y = get_coordinate("target", "y")
  puts
  puts "Start position: [#{start_x}, #{start_y}]"
  puts "Target position: [#{target_x}, #{target_y}]"
  puts
  [[start_x.to_i, start_y.to_i], [target_x.to_i, target_y.to_i]]
end

def is_integer?(string)
  string.to_i.to_s == string
end

def get_coordinate(s_or_t, x_or_y)
  valid_pos = false
  until valid_pos
    print "Enter #{s_or_t} position #{x_or_y}-coordinate (0 - #{@size - 1}): "
    coord = gets.chomp
    valid_pos = true if is_integer?(coord) and coord.to_i >= 0 and coord.to_i < @size
    puts "Please enter a valid value." if !valid_pos
  end
  coord
end

positions = get_positions
knight.knight_moves(positions[0], positions[1])