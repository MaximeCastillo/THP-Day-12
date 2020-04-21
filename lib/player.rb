class Player
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    if @life_points > 0
      "#{name} a #{life_points} points de vie"
    else
      "#{name} est hors jeu !"
    end
  end

  def gets_damage (damage_received)
    @life_points -= damage_received
    puts "Le joueur #{name} a été tué !" if @life_points <= 0
  end

  def attacks (player)
    if player.life_points > 0
      puts "Le joueur #{name} attaque le joueur #{player.name}"
      damage_received = compute_damage
      puts "Il lui inflige #{damage_received} points de dommages"
      player.gets_damage(damage_received)
    else
      puts "#{player.name} n'est plus là !"
    end
    puts
  end

  def compute_damage
    return rand(1..6)
  end
end

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize (name)
    @name = name
    @life_points = 100
    @weapon_level = 1
  end

  def show_state
    "#{name} a #{life_points} points de vie et une arme de niveau #{weapon_level}"
  end

  def compute_damage
    return rand(1..6) * @weapon_level
  end

  def search_weapon
    found_weapon_level = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{found_weapon_level}"
    if found_weapon_level > @weapon_level
      @weapon_level = found_weapon_level
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
    else
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end
    puts
  end

  def search_health_pack
    found_item = rand(1..6)
    if found_item == 1
      puts "Tu n'as rien trouvé..."
    elsif found_item >= 2 && found_item <=5
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
      if @life_points <= 50
        @life_points += 50
      else
        @life_points = 100
      end
    else
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
      if @life_points <= 80
        @life_points += 80
      else
        @life_points = 100
      end
    end
    puts
  end

end