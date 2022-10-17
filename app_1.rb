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

def attacks(giver,receiver)
    print "\n  #{giver.name} "
    random_type_attack
    random_adjectif
    print "#{receiver.name}\n"   
  
    x = rand(1..6)
    receiver.gets_damage(x)
    puts "  et lui inflige #{x} point(s) de dommages !!"
end

def random_type_attack
    x = rand(0..4)
    if x == 0
        print "attaque avec lacheté et férocité "
    elsif x == 1
        print "gifle par surprise et mépris "
    elsif x == 2
        print "assène un coup entre les jambes à "
    elsif x == 3
        print "fait sentir son haleine du réveil à "
    elsif x == 4
        print "lance un regard pétrifiant à "
    end
end

def random_adjectif
    x = rand(0..4)
    if x == 0
        print "le pauvre "
    elsif x == 1
        print "l'intrépide "
    elsif x == 2
        print "ce malotru de "
    elsif x == 3
        print "ce nul de "
    elsif x == 4
        print "l'autre délinquant de "
    end
end

def print_looser(player1,player2)
    if player1.life_points <= 0
    looser = player1
    else
    looser = player2
    end
    print "\n  .... #{looser.name} is Dead ...\n\n"
end

init_game
players_statut(player1,player2)
fight(player1,player2)

