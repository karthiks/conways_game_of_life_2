require 'position'

class Array
  def to_pos
    raise Exception.new("Array size has to be of length 2") if size != 2
    raise Exception.new("Array elements has to be integer") unless 
      (self[0].class==Fixnum && self[1].class==Fixnum)
    Position.new(self[0],self[1])
  end
end
