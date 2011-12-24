require 'spec_helper'
require 'conways_game_of_life_2'
require 'cell'

describe GameOfLife do
  it "should translate seed lives to current generation lives" do
    lives = [[0,0],[1,2],[3,2]]
    result = [Cell.new(0,0), Cell.new(1,2), Cell.new(3,2)]
    gol = GameOfLife.new(lives)
    gol.current_generation.should == result
  end

  it "should have states of previous, current and next generation"
end
