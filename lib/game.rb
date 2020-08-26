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
        @ennemies.each do |e|
            if e.life_points <= 0
                @ennemies = @ennemies - [e]
            end
        end
    end

    def is_still_ongoing?
        if @human_player.life_points > 0 && ennemies.empty? == false
            return true
        else
            return false
        end
    end

    def show_players
        p "#{@human_player.name} dispose de #{@human_player.life_points} points de vie"
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
        if @ennemies[0].nil?
            p " Ce bot est mort"
        else
            p "0 - Attaquer #{@ennemies[0].name}"
        end
        if @ennemies[1].nil?
            p " Ce bot est mort"
        else
            p "1 - Attaquer #{@ennemies[1].name}"
        end
        if @ennemies[2].nil?
            p " Ce bot est mort"
        else
            p "2 - Attaquer #{@ennemies[2].name}"
        end
        if @ennemies[3].nil?
            p " Ce bot est mort"
        else
            p "3 - Attaquer #{@ennemies[3].name}"
        end
    end

    def menu_choice
        while @human_player.life_points > 0 && (@ennemies[0].life_points > 0 || @ennemies[1].life_points > 0 || @ennemies[2].life_points > 0 || @ennemies[3].life_points > 0)
            menu
            input_menu = gets.chomp.to_s 
            case 
            when input_menu == 'a'
                @human_player.search_weapon
            when input_menu == 's'
                @human_player.search_health_pack
            when input_menu == '0'
                @human_player.attacks(@ennemies[0])
                kill_player
                show_players
                ennemies_attack
            when input_menu == '1'
                @human_player.attacks(@ennemies[1])
                kill_player
                show_players
                ennemies_attack
            when input_menu == '2'
                @human_player.attacks(@ennemies[2])
                kill_player
                show_players
                ennemies_attack
            when input_menu == '3'
                @human_player.attacks(@ennemies[3])
                kill_player
                show_players
                ennemies_attack
            else
                p "Tous les bots sont mort"
            end
        end
    end

    def ennemies_attack
        @ennemies.each do |ennemy|
            if ennemy.life_points > 0
            ennemy.attacks(@human_player)
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
