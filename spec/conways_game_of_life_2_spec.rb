require 'conways_game_of_life_2'
require 'cell'

describe GameOfLife do

  context "seeding" do
    it "should translate seed lives to current generation lives" do
      lives = [[0,0],[1,2],[3,2]]
      result = [Cell.new(0,0), Cell.new(1,2), Cell.new(3,2)]
      gol = GameOfLife.new(lives)
      gol.current_generation.should == result
    end

    it "should have states of previous, current and next generation" do
      gol = GameOfLife.new
      gol.respond_to?(:previous_generation).should be_true
      gol.respond_to?(:current_generation).should be_true
      gol.respond_to?(:next_generation).should be_true
    end

    it "should initialize to empty state when no lives are seeded" do
      gol = GameOfLife.new
      gol.previous_generation.should == []
      gol.current_generation.should == []
      gol.next_generation.should == []
    end
  end
end
