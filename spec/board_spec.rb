require 'board'
require 'cell'

describe Board do

  describe "initialization" do
    it "should create life-cells and current_generation with life-cell positions" do
      life_cell_positions = [[1,0],[2,2], [3,2]]
      board = Board.new(life_cell_positions)
      board.life_cell_positions.should == life_cell_positions
      board.current_generation_lives.should == life_cell_positions.map {|x,y| Cell.new(x,y)}
    end
  end

  describe "mark" do
    it "should mark cell state to DIES, 
    if neighbour count IS LESS THAN 2 [under-population]" do
      life_positions = [[0,0]]
      cell = Cell.new(0,0)
      Cell.should_receive(:new).with(0,0).and_return(cell)
      board = Board.new(life_positions)
      board.mark
    end

    it "should mark cell state to DIES, 
    if neighbour count IS GREATER THAN 3 [over-crowding]"

    it "should mark cell state to LIVES, 
    if neighbour count IS 2-3 [over-crowding]"
  end
end
