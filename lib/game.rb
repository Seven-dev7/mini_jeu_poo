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

    def show_players
        p "Notre joueur dispose de #{@human_player.life_points} points de vie"
        p "Il reste encore #{@ennemies.count} bots en vie"
    end

    def intro
        p "------------------------------------------------"
        p "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
        p "|Le but du jeu est d'être le dernier survivant !|"
        p "-------------------------------------------------"
        p "Le combat du jour est composé de #{@human_player.name} contre nos magnifique BOTS, j'ai nommé : "
        p " --> #{show_bots_name}"
    end

    def menu
        p "Menu"
        p "a - chercher une meilleure arme"
        p "s - chercher à se soigner"
        p "attaquer un joueur en vue :"
        p "0 - Attaquer #{@ennemies[0].name}"
        p "1 - Attaquer #{@ennemies[1].name}"
        p "2 - Attaquer #{@ennemies[2].name}"
        p "3 - Attaquer #{@ennemies[3].name}"
    end

    def menu_choice
        while @human_player.life_points > 0 && (@ennemies[0].life_points > 0 || @ennemies[1].life_points > 0 || @ennemies[2].life_points > 0 || @ennemies[3].life_points > 0)
            input_menu = gets.chomp.to_s 
            case 
            when input_menu == 'a'
                @human_player.search_weapon
            when input_menu == 's'
                @human_player.search_health_pack
            when input_menu == '0'
                @human_player.attacks(@ennemies[0])
            when input_menu == '1'
                @human_player.attacks(@ennemies[1])
            when input_menu == '2'
                @human_player.attacks(@ennemies[2])
            when input_menu == '3'
                @human_player.attacks(@ennemies[3])
            else 
                p "Veuillez taper uniquement les valeurs indiquées"
            end
            @ennemies.each do |ennemy|
                if ennemy.life_points > 0
                puts "#{ennemy.name} attaque #{@human_player.name}"
                ennemy.attacks(@human_player)
                end
            end
        end
    end


    private

    def show_bots_name
        @ennemies_name = []
        @ennemies.each do |ennemy|
            @ennemies_name << ennemy.name
            @ennemies_name
        end
        @ennemies_name.join(", ")
    end
end
