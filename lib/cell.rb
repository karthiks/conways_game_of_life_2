require 'array'
require 'position'

class Cell
  include Comparable

  DIES = :DIES
  LIVES = :LIVES
  BE_BORN = :BE_BORN

  attr_reader :position, :neighbours_count, :board, :neighbour_positions
  attr_accessor :state

  def initialize(board, pos)
    @position = pos
    @neighbour_positions = self.class.compute_neighbour_positions(pos)
    @board = board
  end

  def <=> cell
    self.position <=> cell.position
  end

  def eql? cell
    if self.class == cell.class &&
      self.position == cell.position
      return true
    end
    false
  end

  def hash
    #(position.x_position * 111) + (position.y_position * position.x_position)
    position.hash
  end

  def neighbours_count
    life_cell_positions = @board.life_cell_positions
    count = @neighbour_positions.inject(0) do |count, pos| 
      (life_cell_positions.include? pos) ? count + 1 : count
    end
    count
  end

  def self.compute_neighbour_positions(position)
    position.neighbours.map {|p| p.to_pos}
  end

  def to_s
    @position.to_s
  end
end
