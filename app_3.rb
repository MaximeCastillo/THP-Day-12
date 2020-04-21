require 'bundler'
Bundler.require

require_relative 'lib/game.rb'
require_relative 'lib/player.rb'

puts "      -------------------------------------------------"
puts "      |Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "      |Le but du jeu est d'être le dernier survivant !|"
puts "      -------------------------------------------------"

puts "Pour commencer, indiquez votre pseudo :"
print "> "
my_game = Game.new(gets.chomp)

while my_game.is_still_ongoing?
  my_game.menu
  print "> "
  my_game.menu_choice(gets.chomp)
  puts "--------------------------"
  sleep 3
  my_game.ennemies_attack
  sleep 3
end
sleep 2
my_game.end