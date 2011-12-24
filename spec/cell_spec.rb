
describe Cell do
  it "should stringify itself to its x-y co-ortinates" do
    cell = Cell.new(1,2)
    cell.to_s.should == "(1,2)"
  end

  describe "comparability" do
    it "should consider y-position first for comparison" do
      big_y_cell = Cell.new(1,2)
      small_y_cell = Cell.new(2,1)
      (big_y_cell > small_y_cell).should be_true
    end

    it "should consider x-position when y-positions are equal" do
      small_x_cell = Cell.new(1,1)
      big_x_cell = Cell.new(2,1)
      (big_x_cell > small_x_cell).should be_true
    end

    it "should return equal when both positions are same" do
      cell_1 = Cell.new(1,1)
      cell_2 = Cell.new(1,1)
      (cell_1 == cell_2).should be_true
    end
  end

  describe "under-population" do
    it "should DIE, if neighbour count IS LESS THAN 2"
  end

  describe "over-crowding" do
    it "should DIE, if neighbour count IS GREATER THAN 3"
  end

  describe "sustainenance" do
    it "should LIVE-ON to next generation, if neighbour count IS 2-3"
  end

  describe "birth" do
    it "should give birth to itself from DEATH, if neighbour count IS 3"
  end
end
