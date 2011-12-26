require 'array'

describe Array do
  describe "to_pos" do
    it "should raise an Error if Array size is NOT EQUAL TO 2" do
      ->{[].to_pos}.should raise_error(Exception, "Array size has to be of length 2")
      ->{[1,2,3].to_pos}.should raise_error(Exception, "Array size has to be of length 2")
    end

    it "should raise an Error if Array elements are not an integer" do
      ->{["asd",123.45].to_pos}.should raise_error(Exception, "Array elements has to be integer")
    end

    it "should return Position object when all is well" do
      [1,2].to_pos.should == Position.new(1,2)
    end
  end
end

