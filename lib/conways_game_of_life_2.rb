require 'set'
require 'array'
require 'position'

class GameOfLife

  attr_reader :generations_to_evolve, :generations

  def initialize(lives = [], generations_count = 0)
    @generations = []
    @generations_to_evolve = generations_count
    @board = Board.new(unique_life_positions(lives))
    @generations << @board.life_cell_positions
  end

  def evolve
    #puts "Generation 0: #{@current_generation}"
    generations_count.times do |index|
      @board.mark
      @board.sweep
      #puts "Generation #{index + 1}: #{@board.life_positions}"
      @generations << @board.life_positions
    end
  end

  private

  def unique_life_positions(lives)
    input = lives.nil? ? [] : lives.to_set.to_a
    input.map {|arr| arr.to_pos}
  end
end
