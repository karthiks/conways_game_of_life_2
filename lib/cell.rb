
class Cell
  include Comparable

  attr_reader :position

  def initialize(x, y)
    @position = Position.new(x,y)
  end

  def <=> cell
    self.position <=> cell.position
  end
end
