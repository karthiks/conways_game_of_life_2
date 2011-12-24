require 'position'

class Cell
  include Comparable

  attr_reader :position, :neighbours_count

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
