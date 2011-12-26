require 'position'

class Cell
  include Comparable

  DIES = :DIES
  LIVES = :LIVES
  BE_BORN = :BE_BORN

  attr_reader :position, :neighbours_count, :board, :neighbour_positions
  attr_accessor :state

  def initialize(board, x, y)
    @position = Position.new(x,y)
    @neighbour_positions = self.class.compute_neighbour_positions(x,y)
    @board = board
  end

  def <=> cell
    self.position <=> cell.position
  end

  def neighbours_count
    life_cell_positions = @board.life_cell_positions
    count = neighbour_positions.inject(0) do |count, pos| 
      (life_cell_positions.include? pos.to_a) ? count + 1 : count
    end
    count
  end

  def self.compute_neighbour_positions(x,y)
    pos = [ [x-1,y], [x+1,y], #neighbours in same row
      [x-1,y+1], [x,y+1], [x+1,y+1], #neighbours in top row
      [x-1,y-1], [x,y-1], [x+1,y-1] ] #neighbours in bottom row
  end

  def to_s
    @position.to_s
  end
end
