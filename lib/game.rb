class Game
    
    attr_accessor :human_player, :ennemies

    def initialize(human_player)
        @human_player = HumanPlayer.new("#{human_player}")
        @ennemies = []
        bot1 = Player.new("Jose")
        bot2 = Player.new("Josiane")
        bot3 = Player.new("JP")
        bot4 = Player.new("Catogan")
        [bot1, bot2, bot3, bot4].each do |ennemy|
            ennemies << ennemy
        end
    end

    def kill_player
        @ennemies.delete(@ennemies.last)
        p @ennemies
=begin
        @ennemies.each do |e|
            if e.life_points <= 0
                @ennemies - [e]
                p "#{e.name} est mort"
                p @ennemies.inspect
            end
        end
=end
    end

    def is_still_ongoing?
        if @human_player.life_points > 0 && ennemies.empty? == false
            return true
        else
            return false
        end
    end
end