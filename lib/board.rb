require 'set'

class Board

  attr_reader :life_cell_positions,
    :previous_generation_lives,
    :current_generation_lives,
    :next_generation_lives

  def initialize(life_positions)
    @life_cell_positions = life_positions
    @current_generation_lives = life_cells(@life_cell_positions)
    @previous_generation_lives = @next_generation_lives = []
  end

  def life_cells(positions)
    cells = []
    positions.each do |position|
      cells << Cell.new(self, position)
    end
    cells
  end

  def self.cell_neighbours_count(posi, board)
    count = Cell.compute_neighbour_positions(posi).inject(0) do |count, pos| 
      (board.life_cell_positions.include? pos) ? count + 1 : count
    end
    count
  end

  def mark
    @current_generation_lives.each do |life|
      case life.neighbours_count
      when 2..3
        @next_generation_lives << life.dup
        life.state = Cell::LIVES
      else
        life.state = Cell::DIES
      end
    end

    #Identifying the possibility of birth of new cell
    all_neighbour_cell_positions = []
    life_cell_positions.each do |posi|
      all_neighbour_cell_positions.concat Cell.compute_neighbour_positions(posi)
    end
    (all_neighbour_cell_positions - life_cell_positions).each do |p|
      case self.class.cell_neighbours_count(p,self)
      when 3..8
        cell = Cell.new(self, p)
        @next_generation_lives << cell unless @next_generation_lives.include? cell
      end
    end
  end

  def sweep
    @previous_generation_lives = @current_generation_lives
    @current_generation_lives = @next_generation_lives
    @next_generation_lives = []
  end
end
