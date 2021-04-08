require_relative "square"

class MoveTree
  def initialize(size, possible_moves)
    @possible_moves = possible_moves
    @size = size
    @target = nil
  end

  def get_moves(start_pos, end_pos)
    start_node = Square.new(start_pos[0], start_pos[1])
    target_node = find_node([start_node], end_pos)
  end
 
  # Redo with map / filter
  # def get_next_moves(x,y)
  #   moves = []
  #   @possible_moves.each do |move|
  #     if (x + move[0] >= 0 and x + move[0] < @size) and (y + move[1] >= 0 and y + move[1] <@size)
  #       moves.push([x + move[0], y + move[1]])
  #     end
  #   end
  # moves
  # end

  private 

  def get_next_moves(node)
    @possible_moves.filter_map do |move|
      next_x = node.x_coord + move[0]
      next_y = node.y_coord + move[1]
      [next_x, next_y] if (next_x >= 0 and next_x <8 ) and (next_y >= 0 and next_y < 8)
    end
  end
  
  def find_node(queue, end_pos)
    node = queue.shift
    return node if node.x_coord == end_pos[0] and node.y_coord == end_pos[1]
    moves = get_next_moves(node)
    moves.each do |move|
      queue.push << Square.new(move[0], move[1], node)
    end
    find_node(queue, end_pos)
  end
end

