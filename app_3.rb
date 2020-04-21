require 'bundler'
Bundler.require

require_relative 'lib/game.rb'
require_relative 'lib/player.rb'

my_game = Game.new("Wolverine")

binding.pry