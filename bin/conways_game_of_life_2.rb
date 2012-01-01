#!/usr/bin/env ruby

$LOAD_PATH.unshift File.dirname(__FILE__)

require 'lib/conways_game_of_life_2'

lives = [
  [0,0],
  [1,0],
  [0,1],
  [1,1]
]

generations_count = 1

gol = GameOfLife.new(lives,generations_count)

gol.evolve

