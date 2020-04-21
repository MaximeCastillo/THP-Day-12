class Game
  attr_accessor :human_player, :enemies
  
  def initialize (name)
    @user = HumanPlayer.new(name)
    @enemies = []
    @enemies.push(Player.new("player#{i}"))
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
    @enemies.each do |player|
      puts player.show_state
    end
  end



end