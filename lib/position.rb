
class Position
  include Comparable

  attr_reader :x_position, :y_position

  def initialize(x,y)
    @x_position = x
    @y_position = y
  end

  def <=> posi
    return -1 if posi.nil?
    result = @y_position <=> posi.y_position
    case result
      when 0
        return @x_position <=> posi.x_position
      when -1, 1
        return result
    end
  end

  def to_s
    return "(#{@x_position},#{@y_position})"
  end

  def to_a
    return [x_position, y_position]
  end
end
