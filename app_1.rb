require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Dylanou")
player2 = Player.new("Gillianou")

# binding.pry
def init_game
    print "\n---------------------------------------\n"
    print "|     WELCOME TO A SANGUINARY GAME    |\n"
    print "---------------------------------------"
end

def players_statut(player1, player2)
    print "\n---------------------------------------\n"
    print "|         ETAT DES COMBATTANTS        |\n"
    print "---------------------------------------\n"
    player1.show_state
    player2.show_state
end

def fight(player1,player2)
    while ( player1.life_points > 0 ) && ( player2.life_points > 0 )
        print "---------------------------------------\n"
        print "|      EN AVANT LA FILOCHE !!!        |\n"
        print "---------------------------------------\n"      
        attacks(player2,player1)
        break if (player1.life_points <= 0)
        players_statut(player1,player2)
        print "---------------------------------------\n"
        print "|      EN AVANT LA FILOCHE !!!        |\n"
        print "---------------------------------------\n"      
        attacks(player1,player2)
        break if (player2.life_points <= 0)
        players_statut(player1,player2)
    end
    print_looser(player1,player2)
end

def attacks(donneur,receveur)
    x = rand(0..4)
    if x == 0
        puts "#{donneur.name} attaque #{receveur.name} avec lacheté et férocité ..."
    elsif x == 1
        puts "#{donneur.name} gifle #{receveur.name} par surprise et mépris ..."
    elsif x == 2
        puts "#{donneur.name} assène un coup à #{receveur.name} entre les jambes ..."
    elsif x == 3
        puts "#{donneur.name} fait sentir son haleine du réveil à #{receveur.name} ..."
    elsif x == 4
        puts "#{donneur.name} lance un regard menaçant à #{receveur.name} qui en est pétrie par la peur ..."
    end
    x = rand(0..6)
    receveur.gets_damage(x)
    puts "et lui inflige #{x} points de dommages !!"
end

def print_looser(player1,player2)
    if player1.life_points <= 0
    looser = player1
    else
    looser = player2
    end
    print "\n#{looser.name} is Dead ...\n\n"
end

init_game
players_statut(player1,player2)
fight(player1,player2)

