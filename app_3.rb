require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


my_game = Game.new("PLAYER")

opponent1 = HumanPlayer.new("DYLAN LE BADASS")
opponent2 = HumanPlayer.new("GILLIAN LE TYRAN")

# binding.pry




player = init_game
players_statut(player,opponent1,opponent2)
fight(player,opponent1,opponent2)