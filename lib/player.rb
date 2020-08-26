class Player
    
    attr_accessor :name, :life_points

    def initialize(name)
        @name = name
        @life_points = 20
    end

    def show_state
        puts "#{@name} a #{@life_points} points de vie"
    end

    def get_damage(dmg)
        @life_points = @life_points - dmg.to_i
        if @life_points <= 0
            puts "#{name} est mort"
        else
            puts "Il ne reste que #{@life_points} points de vie a #{name}"
        end
    end

    def attacks(attacked_player)
        puts "le joueur #{self.name} attaque le joueur #{attacked_player.name} et lui inflige #{dmg = compute_damage} dégats."
        attacked_player.get_damage(dmg)
    end

    def compute_damage
        return rand(1..6)
    end
    
end

class HumanPlayer < Player
    
    attr_accessor :weapon_level

    def initialize(name)
        @name = name
        @life_points = 100
        @weapon_level = 1
    end

    def show_state
        puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
    end

    def compute_damage
        rand(1..6) * @weapon_level
    end

    def search_weapon
        result_rand = rand(1..6)
        if result_rand > @weapon_level
            @weapon_level = result_rand
            p "J'ai trouvé une arme de niveau #{@weapon_level}. Je la garde, car elles est plus puissante que l'ancienne"
        else 
            p "Zut cette arme n'est pas plus puissante que l'ancienne"
        end
    end

    def search_health_pack
        result_rand = rand(1..6)
        if result_rand == 1
            p "Tu n'as rien trouvé"
        elsif result_rand == 6
            @life_points += 80
            @life_points = 100 if @life_points > 100
        else 
            @life_points += 50
            @life_points = 100 if @life_points > 100
        end
        
    end
end
