require 'position'

describe Position do

  it "should stringify itself to its x-y co-ortinates" do
    position = Position.new(1,2)
    position.to_s.should == "(1,2)"
  end


  describe "comparability" do
    it "should consider y-position first for comparison" do
      big_y_position = Position.new(1,2)
      small_y_position = Position.new(2,1)
      (big_y_position > small_y_position).should be_true
    end

    it "should consider x-position when y-positions are equal" do
      small_x_position = Position.new(1,1)
      big_x_position = Position.new(2,1)
      (big_x_position > small_x_position).should be_true
    end

    it "should return equal when both positions are same" do
      position_1 = Position.new(1,1)
      position_2 = Position.new(1,1)
      (position_1 == position_2).should be_true
    end
  end

end
