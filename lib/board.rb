
class Board

  attr_reader :life_cell_positions, :lives

  def initialize(life_positions)
    @life_cell_positions = life_positions
    @lives = life_cells(@life_cell_positions)
  end

  def life_cells(lives)
    return [] if lives.nil?
    cells = []
    lives.each do |x_position,y_position|
      cells << Cell.new(x_position,y_position)
    end
    cells
  end
end
