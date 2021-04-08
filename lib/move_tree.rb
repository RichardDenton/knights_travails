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

  private 

  def get_next_moves(node)
    @possible_moves.filter_map do |move|
      next_x = node.x_coord + move[0]
      next_y = node.y_coord + move[1]
      [next_x, next_y] if (next_x >= 0 and next_x < @size ) and (next_y >= 0 and next_y < @size)
    end
  end
  
  def find_node(queue, end_pos)
    # Breadth first search that generates a graph with each node referencing its parent
    node = queue.shift
    return node if node.x_coord == end_pos[0] and node.y_coord == end_pos[1]
    moves = get_next_moves(node)
    moves.each do |move|
      queue.push << Square.new(move[0], move[1], node)
    end
    find_node(queue, end_pos)
  end
end

