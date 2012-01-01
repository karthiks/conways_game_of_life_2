require 'conways_game_of_life_2'
require 'cell'
require 'board'

describe GameOfLife do

  context "seeding" do
    it "should translate seed lives to current generation lives" do
      lives = [[0,0],[1,2],[3,2]]
      gol = GameOfLife.new(lives)
      gol.generations[0].map {|p| p.to_s}.should == 
        lives.map {|x,y| Position.new(x,y).to_s}
    end

    it "should ignore duplicates in seed" do
      lives = [[0,0],[1,2],[3,2],[0,0],[3,2]]
      positions = [[0,0],[1,2],[3,2]].map {|x,y| Position.new(x,y).to_s}  
      mock_board = mock('Board')
      gol = GameOfLife.new(lives)
      gol.generations[0].map {|p| p.to_s}.should == positions
    end

    it "should initialize to empty state when no lives are seeded" do
      gol = GameOfLife.new
      gol.generations[0].should == []
    end

    it "should have count of the number of generations to be evolved, 
    with 0 as default value" do
      gol = GameOfLife.new
      gol.generations_to_evolve.should == 0
    end
  end

  describe "evolution" do  
    it "should respond to evolve" do
      GameOfLife.new.respond_to?(:evolve).should be_true
    end

    it "should mark and sweep the board the number of generations to move" do
      lives = [ [0,0], [1,0], [0,1], [1,1] ]
      generations_count = 1
      mock_board = mock('Board')
      Board.should_receive(:new).with(any_args()).and_return(mock_board)
      mock_board.should_receive(:mark).exactly(1).times
      mock_board.should_receive(:sweep).exactly(1).times
      mock_board.should_receive(:current_generation_lives).exactly(2).times
      gol = GameOfLife.new(lives, generations_count)
      gol.evolve
    end

    it "should maintain the same state in next generation too" do
      lives = [ [0,0], [1,0], [0,1], [1,1] ]
      generations_count = 1
      gol = GameOfLife.new(lives, generations_count)
      gol.evolve
      gol.generations.size.should == 2
      gol.generations.last.should == gol.generations.first
    end

    it "should have no lives in the next generation" do
      lives = [ [0,0], [1,2] ]
      generations_count = 1
      gol = GameOfLife.new(lives, generations_count)
      gol.evolve
      gol.generations.size.should == 2
      gol.generations.last.should == []
    end
  end
end
