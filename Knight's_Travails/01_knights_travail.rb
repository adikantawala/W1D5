class KnightPathFinder
  ALL_DIRECTIONS = [[-1, -2], [1, -2], [-1, 2], [1, 2], [-2, -1], [-2, 1], [2, -1], [2, 1]]
  def initialize(starting_pos = [0,0])
    @starting_pos = starting_pos
    @grid = Array.new(8) {Array.new(8,nil)}
    @root_node = PolyTreeNode.new(@starting_pos)
    @possible_moves = build_moves_tree
    @visited_pos = [starting_pos]
  end

  def build_moves_tree
    new_move_positions(pos)
  end

  def new_move_positions(pos) #filter out if in visited_pos
    final = KnightPathFinder.valid_moves(pos)
    final.reject! {|el| @visited_pos.include?(el)}
    @visited_pos += final
    final
  end

  def self.valid_moves(pos) #return all 8 positions
    final = []
    ALL_DIRECTIONS.each do |el|
      final << [el[0] + pos[0] , el[-1] + pos[-1]]
    end
    final.select! {|el| el[0].between?(0, 7) && el[-1].between?(0, 7)}
    final
  end
end
