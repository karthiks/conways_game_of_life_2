require 'board'
require 'cell'
require 'array'
require 'position'

describe Board do

  describe "initialization" do
    it "should create life-cells and current_generation with life-cell positions" do
      life_cell_positions = [[1,0],[2,2], [3,2]].map {|p| p.to_pos}
      board = Board.new(life_cell_positions)
      board.life_cell_positions.should == life_cell_positions
      board.current_generation_lives.should == life_cell_positions.map {|pos| Cell.new(board,pos)}
    end
  end

  describe "mark" do
    it "should mark cell state to DIES, 
    if neighbour count IS LESS THAN 2 [under-population]" do
      life_positions = [[0,0].to_pos]
      board = Board.new(life_positions)
      board.mark
      board.next_generation_lives.should == []
    end

    it "should mark cell state to DIES, 
    if neighbour count IS GREATER THAN 3 [over-crowding]" do
      life_positions = [[0,0],[0,1],[0,2],[1,1],[2,2]].map {|p| p.to_pos}
      board = Board.new(life_positions)
      board.mark 
      board.next_generation_lives.should_not include(Cell.new(board,[1,1].to_pos))
    end

    it "should mark cell state to LIVES, 
    if neighbour count IS 2-3 [ideal-population]" do
      life_positions = [[0,0],[0,1],[1,1]].map {|p| p.to_pos}
      board = Board.new(life_positions)
      board.mark
      board.next_generation_lives.should == [Cell.new(board,[0,0].to_pos), 
        Cell.new(board,[0,1].to_pos), Cell.new(board,[1,1].to_pos),
        Cell.new(board,[1,0].to_pos)]
    end

    context "dead cell" do
      it "should create new Cell for next generation, 
      if neighbour count IS GREATER THAN 3 [birth with 3-some]" do
        life_positions = [[0,0],[1,2],[2,0]].map {|p| p.to_pos}
        board = Board.new(life_positions)
        board.mark 
        board.next_generation_lives.should  == [Cell.new(board,[1,1].to_pos)]
      end
    end
  end
end
