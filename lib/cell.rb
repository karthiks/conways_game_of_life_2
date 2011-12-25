require 'position'

class Cell
  include Comparable

  DIES = :DIES
  LIVES = :LIVES
  BE_BORN = :BE_BORN

  attr_reader :position, :neighbours_count
  attr_accessor :state

  def initialize(x, y)
    @position = Position.new(x,y)
  end

  def <=> cell
    self.position <=> cell.position
  end

  def neighbours_count
    1
  end
end
