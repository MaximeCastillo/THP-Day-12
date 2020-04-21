require 'bundler'
Bundler.require

require_relative 'lib/game.rb'
require_relative 'lib/player.rb'

puts "      -------------------------------------------------"
puts "      |Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "      |Le but du jeu est d'être le dernier survivant !|"
puts "      -------------------------------------------------"

puts "Pour commencer, indiquez votre prénom :"
print "> "
user = HumanPlayer.new(gets.chomp)

player1 = Player.new("Pathfinder")
player2 = Player.new("Wraith")
enemies = [player1, player2]

while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
  puts "--------------------------------------------------"
  puts user.show_state
  puts
  puts "Quelle action veux-tu effectuer ?"
  puts "a - Chercher une meilleure arme"
  puts "s - Chercher à se soigner"
  puts
  puts "Attaquer un joueur en vue :"
  puts "0 - #{player1.show_state}"
  puts "1 - #{player2.show_state}"
  puts
  print "> "
  case gets.chomp
  when "a"
    user.search_weapon
  when "s"
    user.search_health_pack
  when "0"
    user.attacks(player1)
  when "1"
    user.attacks(player2)
  end
  puts "Les autres joueurs t'attaquent !"
  puts
  enemies.each do |player|
    if player.life_points > 0
      player.attacks(user)
    end
  end
end
puts "La partie est finie"
if user.life_points > 0
  puts "BRAVO ! TU AS GAGNE !"
else
  puts "Loser ! Tu as perdu !"
end