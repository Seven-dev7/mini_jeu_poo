require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'game'
require 'player'

p "------------------------------------------------"
p "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
p "|Le but du jeu est d'être le dernier survivant !|"
p "-------------------------------------------------"





#Initialisation du joueur: ensuite, le jeu va demander à l'utilisateur son prénom et créer un HumanPlayer portant ce prénom."

p "Initialisation du joueur"
p "Quel est ton prénom ?"
name = gets.chomp
user = HumanPlayer.new("#{name}") 
ennemies = []
p "Voici nos 2 ennemis"
player1 = Player.new("josiane")
p "Ici #{player1.name}"
player2 = Player.new("jose")
[player1, player2].each { |p| ennemies << p }
p "Voila #{player2.name}"
while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0 )
    user.show_state
    p "Que veux tu faire?"
    p "a - chercher une meilleure arme"
    p "s - chercher à se soigner"
    p "attaquer un joueur en vue :"
    print "0 - Attaquer "
    player1.show_state
    print "1 - Attaquer " 
    player2.show_state
    print ">"
    input_menu = gets.chomp.to_s 
    case 
    when input_menu == 'a'
        user.search_weapon
    when input_menu == 's'
        user.search_health_pack
    when input_menu == '0'
        user.attacks(player1)
    when input_menu == '1'
        user.attacks(player2)
    else 
        p "Veuillez taper uniquement les valeurs indiquées"
    end
    ennemies.each do |ennemy|
        if ennemy.life_points > 0
        puts "#{ennemy.name} attaque #{user.name}"
        ennemy.attacks(user)
        end
    end
end
p "La partie est fini"
if user.life_points <= 0
    p "Tu pus la merde"
else
    p "Bravo tu as gagné ! "
end






#Initialisation des ennemis : le jeu va maintenant créer nos deux combattants préférés, "Josiane" et "José".
#Comme nous savons qu'à terme (version 3.0) il y aura plus de 2 ennemis, on va mettre en place une astuce pour manipuler facilement un groupe d'ennemis : le jeu va créer un array enemies qui va contenir les deux objets Player que sont José et Josiane. Tu verras plus tard l'usage qu'on va en faire.
#Le combat : tout comme dans la version 1.0, on peut maintenant lancer le combat ! Tu vas ouvrir une boucle while qui ne doit s'arrêter que si le joueur de l'utilisateur (HumanPlayer) meurt ou si les 2 joueurs "bots" (Player) meurent. Cette condition d'arrêt n'est pas triviale à écrire mais je te propose d'essayer ! Sinon la réponse est disponible plus bas. Laisse la boucle while vide pour le moment, on la codera juste après.
#Fin du jeu : maintenant, si on sort de cette boucle while, c'est que la partie est terminée. Donc juste en dessous du end de la boucle, on va préparer un petit message de fin. Le jeu doit afficher "La partie est finie" et ensuite soit afficher "BRAVO ! TU AS GAGNE !" si le joueur humain est toujours en vie, ou "Loser ! Tu as perdu !" s'il est mort.