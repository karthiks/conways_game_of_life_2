
class Cell
  include Comparable

  attr_reader :x_position, :y_position

  def initialize(x_pos, y_pos)
    @x_position = x_pos
    @y_position = y_pos
  end

  def to_s
    return "(#{@x_position},#{@y_position})"
  end

  def <=> (cell)
    return -1 if cell.nil?
    result = @y_position <=> cell.y_position
    case result
      when 0
        return @x_position <=> cell.x_position
      when -1, 1
        return result
    end
  end
end
