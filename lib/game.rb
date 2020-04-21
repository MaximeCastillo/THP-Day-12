class Game
  attr_accessor :human_player, :enemies
  
  def initialize (name)
    @user = HumanPlayer.new(name)
    @enemies = []
    @enemies.push(player1 = Player.new("Magneto"))
    @enemies.push(player2 = Player.new("Dents-de-sabre"))
    @enemies.push(player3 = Player.new("Mystique"))
    @enemies.push(player4 = Player.new("Pyro"))
  end

  def kill_player (player_to_kill)
    @enemies.each do |player|
      return @enemies.delete(player) if player.name == player_to_kill
    end
    puts "Oups ! Aucun ennemi ne porte ce nom !"
    return false
  end

  def is_still_ongoing?
    return @user.life_points > 0 && !@enemies.empty?
  end

  def show_players
    puts @user.show_state
    puts
    @enemies.each do |player|
      puts player.show_state
    end
  end

  def menu
    puts "--------------------------------------------------"
    show_players
    puts
    puts "Quelle action veux-tu effectuer ?"
    puts "a - Chercher une meilleure arme"
    puts "s - Chercher à se soigner"
    puts
    puts "Attaquer un joueur en vue :"
    puts "0 - #{@enemies[0].name}"
    puts "1 - #{@enemies[1].name}"
    puts "2 - #{@enemies[2].name}"
    puts "3 - #{@enemies[3].name}"
    puts
  end

  def menu_choice (input)
    @enemies.each do |player|
      kill_player(player.name) if player.life_points <= 0
    end
    case input
    when "a"
      @user.search_weapon
    when "s"
      @user.search_health_pack
    when "0"
      @user.attacks(@enemies[0])
    when "1"
      @user.attacks(@enemies[1])
    when "2"
      @user.attacks(@enemies[2])
    when "3"
      @user.attacks(@enemies[3])
    end
  end

  def ennemies_attack
    puts "Les autres joueurs t'attaquent !"
    puts
    @enemies.each do |player|
      if player.life_points > 0
        player.attacks(@user)
      end
    end
  end

  def end
    if !is_still_ongoing?
      puts "La partie est finie"
      if @user.life_points > 0
        puts "BRAVO ! TU AS GAGNE !"
      else
        puts "Loser ! Tu as perdu !"
      end
    end
  end

end