
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

  def self.cell_neighbours_count(posi, board)
    count = Cell.compute_neighbour_positions(posi[0],posi[1]).inject(0) do |count, pos| 
      (board.life_cell_positions.include? [pos[0],pos[1]]) ? count + 1 : count
    end
    count
  end

  def mark
    @current_generation_lives.each do |life|
      arr = life.position.to_a
      case life.neighbours_count
      when 2..3
        life.state = Cell::LIVES
        @next_generation_lives << Cell.new(self,arr[0],arr[1])
      else
        life.state = Cell::DIES
      end
    end

    #Identifying the possibility of birth of new cell
    all_neighbour_cells = []
    life_cell_positions.each do |posi|
      all_neighbour_cells.concat Cell.compute_neighbour_positions(posi[0],posi[1])
    end
    puts (all_neighbour_cells.compact - life_cell_positions).inspect
    (all_neighbour_cells.compact - life_cell_positions).each do |pos|
      case self.class.cell_neighbours_count(pos,self)
      when 3..8
        @next_generation_lives << Cell.new(self, pos[0], pos[1])
      end
    end
  end
end
