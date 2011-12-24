
describe Cell do
  it "should stringify itself to its x-y co-ortinates" do
    cell = Cell.new(1,2)
    cell.to_s.should == "(1,2)"
  end
end
