require_relative "move_tree"
class Knight
  def initialize(board_size)
    @possible_moves = [[2, 1], [2, -1], [-2, 1], [-2, -2], [1, 2], [1, -2], [-1, 2], [-1, -2]]
    @move_tree = MoveTree.new(board_size, @possible_moves)
  end

  def knight_moves(start_pos, end_pos)
    moves = @move_tree.get_moves(start_pos, end_pos)
    print_path(moves)
  end

  private
  def print_path(node, path = [[node.x_coord, node.y_coord]])
    if node.parent.nil?
      puts "You made it in #{(path.length) -1} moves! Here's your path:"
      while path.length > 0
        p path.pop
      end
      return
    end
    path << [node.parent.x_coord, node.parent.y_coord]
    print_path(node.parent, path)
  end
end