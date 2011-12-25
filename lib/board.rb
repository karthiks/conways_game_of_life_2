
class Board

  attr_reader :life_cell_positions, :current_generation_lives, :next_generation_lives

  def initialize(life_positions)
    @life_cell_positions = life_positions
    @current_generation_lives = life_cells(@life_cell_positions)
    @next_generation_lives = []
  end

  def life_cells(current_generation_lives)
    return [] if current_generation_lives.nil?
    cells = []
    current_generation_lives.each do |x_position,y_position|
      cells << Cell.new(x_position,y_position)
    end
    cells
  end

  def mark
    current_generation_lives.each do |life|
      case life.neighbours_count
      when 2..3
        life.state = Cell::current_generation_lives
      else
        life.state = Cell::DIES
      end
    end
    current_generation_lives.each do |life|
      @next_generation_lives << Cell.new(life.position.to_a)
    end
  end
end
