require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Dylanou")
player2 = Player.new("Gillianou")

# binding.pry
def init_game
    print "\n  ---------------------------------------\n"
    print "  |     WELCOME TO A SANGUINARY GAME    |\n"
    print "  ---------------------------------------\n\n"
    sleep 2
end

def players_statut(player1, player2)
    print "\n  ---------------------------------------\n"
    print "  |        ETAT DES COMBATTANTS         |\n"
    print "  ---------------------------------------\n"
    display_statut(player1)
    display_statut(player2)
    print "\n\n"
    sleep 4
end

def display_statut(player)
    print "  |  #{player.name}"
    x = player.name.length
    x = 13-x 
    print " "*x
    print "|  Life Points : #{player.life_points}"
    str = player.life_points.to_s
    x = str.length
    x = 5-x
    print " "*x
    print "|\n  ---------------------------------------\n"
end

def fight(player1,player2)
    while ( player1.life_points > 0 ) && ( player2.life_points > 0 )
        punch
        attacks(player2,player1)
        break if (player1.life_points <= 0)
        players_statut(player1,player2)
        punch
        attacks(player1,player2)
        break if (player2.life_points <= 0)
        players_statut(player1,player2)
    end
    print_looser(player1,player2)
end

def punch
    print "  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n"
    print "  @@@     EN AVANT LA FILOCHE !!!     @@@\n"
    print "  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n"
    sleep 2
end

def attacks(giver,receiver)
    print "\n  #{giver.name} "
    random_type_attack
    random_adjectif
    print "#{receiver.name}\n"   
  
    x = rand(1..6)
    receiver.gets_damage(x)
    puts "  et lui inflige #{x} point(s) de dommages !!"
    sleep 5
end

def random_type_attack
    type = ["attaque avec lacheté et férocité ","gifle par surprise et avec mépris ","assène un coup entre les jambes de ","fait sentir son haleine du réveil à ","lance un regard pétrifiant à ","lâche un gros pet en pleine face à "]
    x = rand(0..(type.length-1))
    print type[x]
end

def random_adjectif
    adj = ["ce pauvre ","l'intrépide ","ce malotru de ","ce nul de ","l'autre délinquant de ","ce canaillou de "]
    x = rand(0..(adj.length-1))
    print adj[x]
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

