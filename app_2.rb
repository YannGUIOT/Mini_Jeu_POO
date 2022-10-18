require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

opponent1 = HumanPlayer.new("DYLAN LE BADASS")
opponent2 = HumanPlayer.new("GILLIAN LE TYRAN")

# binding.pry
def init_game
    print "\n\e[41m        \e[1mWELCOME TO A FUCKING SANGUINARY GAME\e[22m        \e[0m\n"
    sleep 0.2
    print "\n ENTER YOUR PLAYER NAME : "
    name = gets.chomp.upcase
    player = HumanPlayer.new(name)
    return player
end

def players_statut(player, opponent1, opponent2)
    print "\n\e[42m                                            \e[1mETAT DES COMBATTANTS\e[22m                                          \e[0m\n"
    player.showstate
    opponent1.showstate
    opponent2.showstate
    print "\e[42m \e[0m"
    print "\e[32m▄\e[0m"*104
    print "\e[42m \e[0m"
    sleep 0.5
end

def your_choice(opponent1,opponent2)
    print "\n\n CHOOSE YOUR ACTION :\n\n   1) SEARCH BEST WEAPON\n   2) SEARCH HEALTH PACK\n"
    print "   3) ATTACK #{opponent1.name}\n" if opponent1.life_points > 0
    print "   4) ATTACK #{opponent2.name}\n\n" if opponent2.life_points > 0
    print "\n" if opponent2.life_points == 0
    print " \e[3mif you enter other... you dead ! ...\e[23m  : "
    choice = gets.to_i
    return choice
end

def fight(player,opponent1,opponent2)
    game = true
    opponent1_is_in_life = true
    opponent2_is_in_life = true
    while game == true

        if game == true
            if player.life_points > 0
                choice = your_choice(opponent1,opponent2)
                if (choice > 0 && choice < 5)
                    system("clear")
                    punch # EN AVANT LA FILOCHE
                end
            end
            case choice
                when 1 then player.search_weapon
                when 2 then player.search_health_pack              
                when 3
                    attacks(player,opponent1) if opponent1_is_in_life == true
                    cant_attack(opponent1) if opponent1_is_in_life == false
                when 4
                    attacks(player,opponent2) if opponent2_is_in_life == true
                    cant_attack(opponent2) if opponent2_is_in_life == false
                else
                    player.life_points = 0
                    game = false
                    break
            end

            # OPPONENTS LIFE VERIFICATION
            opponent1_is_in_life = false if opponent1.life_points == 0
            opponent2_is_in_life = false if opponent2.life_points == 0

            # GAME PARTY VERIFICATION
            game = verify_party(player,opponent1,opponent2)
            if game == false
                players_statut(player,opponent1,opponent2)
                break
            end

            # OPPONENT 1 ATTACK
            attacks(opponent1,player) if game == true && opponent1.life_points > 0

            # GAME PARTY VERIFICATION
            game = verify_party(player,opponent1,opponent2)
            if game == false
                players_statut(player,opponent1,opponent2)
                break
            end

            # OPPONENT 2 ATTACK
            attacks(opponent2,player) if game == true && opponent2.life_points > 0

            #OPPONENT UPDATE
            update_opponent_weapon(opponent1,opponent2)

            # STATUT PLAYERS
            players_statut(player,opponent1,opponent2)
        end
    end
    gameover(player,opponent1,opponent2)
end

def update_opponent_weapon(opponent1,opponent2)
    if opponent1.life_points < 61 || opponent2.life_points < 61
        opponent1.weapon_level = 2 
        opponent2.weapon_level = 2
    end
    if opponent1.life_points < 31 || opponent2.life_points < 31
        opponent1.weapon_level = 3 
        opponent2.weapon_level = 3
    end
end

def verify_party(player,opponent1,opponent2)
    if (player.life_points == 0) || ((opponent1.life_points + opponent2.life_points) == 0)
        return false
    else
        return true
    end
end

def punch
    print "\n\n\e[41m           \e[1mEN AVANT LA FILOCHE !!!\e[22m          \e[0m"
    puts
    sleep 0.2
end

def attacks(giver,receiver)
    print "\e[36m\n#{giver.name} \e[0m"
    x = random_type_attack
    random_adjectif
    print " \e[36m#{receiver.name}\n\e[0m" 
    y = x*giver.weapon_level
    receiver.gets_damage(y)
    print "et lui inflige \e[32m#{y}\e[0m point(s) de dommages !!\n"
    sleep 0.5
end

def cant_attack(opponent)
    print "\n YOU CAN'T ATTACK \e[36m#{opponent.name}\e[0m ! \e[31mHE'S DEAD\e[0m !!!\n\n"
    sleep 0.5
end

def random_type_attack
    type = ["lance un regard pétrifiant à ","fait sentir son haleine du réveil à ","lâche un gros pet en pleine face à ","gifle par surprise et avec mépris ","assène un coup entre les jambes de ","attaque avec lacheté et férocité "]
    x = rand(0..(type.length-1))
    print type[x]
    return x+1
end

def random_adjectif
    adj = ["ce pauvre","l'intrépide","l'autre peigne-zizi de","ce fumier de","ce malotru de","ce nul de","l'autre délinquant de","ce canaillou de","cet hasbeen de"]
    x = rand(0..(adj.length-1))
    print adj[x]
end

def gameover(player,opponent1,opponent2)
    if (opponent1.life_points + opponent2.life_points) == 0
        print "\n\n\e[43m       YOU WIN !!       \e[0m\n\n"
    else
        print "\n\n\e[41m      YOU LOOSE !!      \e[0m\n\n"
    end
end

player = init_game
players_statut(player,opponent1,opponent2)
fight(player,opponent1,opponent2)