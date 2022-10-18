require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("DYLANOU")
player2 = Player.new("GILLIANOU")

# binding.pry
def init_game
    print "\n\e[41m        \e[1mWELCOME TO A SANGUINARY GAME\e[22m        \e[0m\n"
    sleep 1.5
end

def players_statut(player1, player2)
    print "\n\e[42m             \e[1mETAT DES COMBATTANTS\e[22m           \e[0m\n"
    player1.showstate
    player2.showstate
    print "\e[42m \e[0m"*44
    sleep 2.5
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
    print "\n\e[41m           \e[1mEN AVANT LA FILOCHE !!!\e[22m          \e[0m\n"
    sleep 1.5
end

def attacks(giver,receiver)
    print "\e[36m\n#{giver.name} \e[0m"
    x = random_type_attack
    random_adjectif
    print " \e[36m#{receiver.name}\n\e[0m"   
    receiver.gets_damage(x)
    print "et lui inflige \e[32m#{x}\e[0m point(s) de dommages !!\n"
    sleep 3.5
end

def random_type_attack
    type = ["lance un regard pétrifiant à ","fait sentir son haleine du réveil à ","lâche un gros pet en pleine face à ","gifle par surprise et avec mépris ","assène un coup entre les jambes de ","attaque avec lacheté et férocité "]
    x = rand(0..(type.length-1))
    print type[x]
    return x+1
end

def random_adjectif
    adj = ["ce pauvre","l'intrépide","ce fumier de","ce malotru de","ce nul de","l'autre délinquant de","ce canaillou de","cet hasbeen de"]
    x = rand(0..(adj.length-1))
    print adj[x]
end

def print_looser(player1,player2)
    if player1.life_points <= 0
    looser = player1
    else
    looser = player2
    end
    print "\n\e[35m         .... \e[1m#{looser.name} is Dead\e[22m ....\e[0m\n\n"
end

init_game
players_statut(player1,player2)
fight(player1,player2)

