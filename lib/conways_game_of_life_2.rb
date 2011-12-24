
class GameOfLife

  attr_reader :previous_generation, :current_generation, :next_generation,
    :generations_to_evolve

  def initialize(lives = [], generations_count = 0)
    @previous_generation = []
    @next_generation = []
    @current_generation = life_cells(lives)
    @generations_to_evolve = generations_count
  end

  def life_cells(lives)
    return [] if lives.nil?
    cells = []
    lives.each do |x_position,y_position|
      cells << Cell.new(x_position,y_position)
    end
    cells
  end

  def evolve
    #TODO code to move on to next generation
  end
end
