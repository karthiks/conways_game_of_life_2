
describe Cell do
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
