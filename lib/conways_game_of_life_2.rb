require 'set'

class GameOfLife

  attr_reader :generations_to_evolve, :generations

  def initialize(lives = [], generations_count = 0)
    @generations = [[]]
    @generations[0] = lives.to_set.to_a unless lives.nil?
    @generations_to_evolve = generations_count
    @board = Board.new(@generations[0])
  end

  def evolve
    puts "Generation 0: #{@current_generation}"
    generations_count.times do |index|
      @board.mark
      @board.sweep
      puts "Generation #{index + 1}: #{@board.life_positions}"
      @generations << @board.life_positions
    end
  end
end
