require 'set'
require 'array'
require 'position'

class GameOfLife

  attr_reader :generations_to_evolve, :generations

  def initialize(lives = [], generations_count = 0)
    @generations = []
    @generations_to_evolve = generations_count
    @board = Board.new(unique_life_positions(lives))
    @generations << @board.current_generation_lives
  end

  def evolve
    generations_to_evolve.times do |index|
      @board.mark
      @board.sweep
      @generations << @board.current_generation_lives
    end
  end

  private

  def unique_life_positions(lives)
    input = lives.nil? ? [] : lives.to_set.to_a
    input.map {|arr| arr.to_pos}
  end
end
