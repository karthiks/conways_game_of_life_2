
class Position
  include Comparable

  attr_reader :x_position, :y_position

  alias :x :x_position   #create an alias :x for :x_position
  alias :y :y_position   #create an alias :y for :y_position
  protected :x, :y

  def initialize(x,y)
    @x_position = x
    @y_position = y
  end

  def neighbours
    [ [x-1,y], [x+1,y], #neighbours in same row
      [x-1,y+1], [x,y+1], [x+1,y+1], #neighbours in top row
      [x-1,y-1], [x,y-1], [x+1,y-1] ] #neighbours in bottom row
  end

  def <=> posi
    return -1 if posi.nil?
    result = y <=> posi.y
    case result
      when 0
        return x <=> posi.x
      when -1, 1
        return result
    end
  end

  def eql? p
    (x == p.x && y == p.y) ? true : false
  end

  def hash
    x * 11 + y
  end

  def to_s
    return "(#{x},#{y})"
  end

  def to_a
    return [x, y]
  end
end
