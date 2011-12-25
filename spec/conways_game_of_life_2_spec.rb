require 'conways_game_of_life_2'
require 'cell'
require 'board'

describe GameOfLife do

  context "seeding" do
    it "should translate seed lives to current generation lives" do
      lives = [[0,0],[1,2],[3,2]]
      gol = GameOfLife.new(lives)
      gol.generations[0].should == lives
    end

    it "should ignore duplicates in seed" do
      lives = [[0,0],[1,2],[3,2],[0,0],[3,2]]
      result = [[0,0],[1,2],[3,2]] 
      Board.should_receive(:new).with(result).and_return(mock('Board'))
      gol = GameOfLife.new(lives)
      gol.generations[0].should == result
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
  end
end
