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
    @neighbour_positions = self.class.compute_neighbour_positions(pos.x_position, pos.y_position)
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

  def self.compute_neighbour_positions(x,y)
    pos = [ [x-1,y], [x+1,y], #neighbours in same row
      [x-1,y+1], [x,y+1], [x+1,y+1], #neighbours in top row
      [x-1,y-1], [x,y-1], [x+1,y-1] ] #neighbours in bottom row
    pos.map {|p| p.to_pos}
  end

  def to_s
    @position.to_s
  end
end
