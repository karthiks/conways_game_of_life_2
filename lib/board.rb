
class Board

  attr_reader :life_cell_positions, :current_generation_lives, :next_generation_lives

  def initialize(life_positions)
    @life_cell_positions = life_positions
    @current_generation_lives = life_cells(@life_cell_positions)
    @next_generation_lives = []
  end

  def life_cells(positions)
    return [] if positions.nil?
    cells = []
    positions.each do |x_position,y_position|
      cells << Cell.new(self, x_position,y_position)
    end
    cells
  end

  def mark
    @current_generation_lives.each do |life|
      puts life.neighbours_count
      case life.neighbours_count
      when 2..3
        life.state = Cell::LIVES
      else
        life.state = Cell::DIES
      end
    end
    @current_generation_lives.each do |life|
      arr = life.position.to_a
      if life.state == Cell::LIVES
        @next_generation_lives << Cell.new(self,arr[0],arr[1])
      end
    end
  end
end
