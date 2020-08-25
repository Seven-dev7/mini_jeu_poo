require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'game'
require 'player'


josiane = HumanPlayer.new("josiane")
p "A ma droite #{josiane.name}"
jose = HumanPlayer.new("jose")
p "A ma gauche #{jose.name}"
puts "Voici l'état de chaque joueur :"
puts "#{josiane.name} dispose de #{josiane.life_points} points de vie."
puts "#{jose.name} dispose de #{jose.life_points} points de vie."
puts "Passons à la phase d'attaque :"
while josiane.life_points > 0 || jose.life_points > 0 
    josiane.search_weapon
    josiane.attacks(jose)
    break if jose.life_points <= 0
    jose.search_health_pack
    jose.attacks(josiane)
    break if josiane.life_points <= 0
end
#binding.pry