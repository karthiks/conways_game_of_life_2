require 'board'
require 'cell'

describe Board do

  describe "initialization" do
    it "should create life-cells and current_generation with life-cell positions" do
      life_cell_positions = [[1,0],[2,2], [3,2]]
      board = Board.new(life_cell_positions)
      board.life_cell_positions.should == life_cell_positions
      board.lives.should == life_cell_positions.map {|x,y| Cell.new(x,y)}
    end
  end
end
