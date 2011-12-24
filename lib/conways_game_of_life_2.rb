
class GameOfLife

  attr_reader :previous_generation, :current_generation, :next_generation

  def initialize(lives = [])
    @previous_generation = []
    @next_generation = []
    @current_generation = life_cells(lives)
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
