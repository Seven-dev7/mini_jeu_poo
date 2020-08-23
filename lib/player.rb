class Player
    
    attr_accessor :name, :life_points

    def initialize(name)
        @name = name
        @life_points = 100
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

    def attacks(a=[])
        puts "le joueur #{self.name} attaque le joueur #{a.name} et lui inflige #{dmg = compute_damage} dégats."
		a.get_damage(dmg)
    end

    def compute_damage
        return rand(1..6)
    end
    
end
