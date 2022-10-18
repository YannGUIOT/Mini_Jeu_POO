class Game

    attr_accessor :human_player, :enemies

    def initialize(player_name)
        @enemies = []
        @human_player = HumanPlayer.new(player_name)
        4.times do |i|
            @enemies << Player.new("ENNEMIE_#{i}")
        end
    end

    def kill_player(dead_ennemie)
        @enemies.delete(dead_ennemie)
    end


    def init_game
        print "\n\e[41m        \e[1mWELCOME TO A FUCKING SANGUINARY GAME\e[22m        \e[0m\n"
        sleep 0.2
        print "\n ENTER YOUR PLAYER NAME : "
        name = gets.chomp.upcase
        player = HumanPlayer.new(name)
        return player
    end

    def players_statut(player, opponent1, opponent2)
        print "\n\e[42m             \e[1mETAT DES COMBATTANTS\e[22m           \e[0m\n"
        player.showstate
        opponent1.showstate
        opponent2.showstate
        print "\e[42m \e[0m"*44
        sleep 0.5
    end


    def your_choice(opponent1,opponent2)
        print "\n\n CHOOSE YOUR ACTION :\n\n 1) SEARCH BEST WEAPON\n 2) SEARCH HEALTH PACK\n 3) ATTACK #{opponent1.name}\n 4) ATTACK #{opponent1.name}\n\n \e[3mif you enter other... you dead ! ...\e[23m  : "
        choice = gets.to_i
        return choice
    end

    def fight(player,opponent1,opponent2)
        game = true
        opponent1_life = true
        opponent2_life = true
        while game == true
    
            if game == true
                if player.life_points > 0
                    choice = your_choice(opponent1,opponent2)
                    if (choice > 0 && choice < 5)
                        system("clear")
                        punch # EN AVANT LA FILOCHE
                    end
                end
                if choice == 1
                    player.search_weapon
                elsif choice == 2
                    player.search_health_pack
                elsif choice == 3
                    if opponent1_life == true
                        attacks(player,opponent1)
                    end
                elsif choice == 4
                    if opponent2_life == true
                        attacks(player,opponent2)
                    end
                else
                    player.life_points = 0
                    game = false
                    break
                end
                # OPPONENTS LIFE VERIFICATION
                if opponent1.life_points == 0
                    opponent1_life == false
                end
                if opponent2.life_points == 0
                    opponent2_life == false
                end
    
                # GAME PARTY VERIFICATION
                game = verify_party(player,opponent1,opponent2)
                if game == false
                    players_statut(player,opponent1,opponent2)
                    break
                end
    
                # OPPONENT 1 ATTACK
                if game == true && opponent1.life_points > 0
                    attacks(opponent1,player)
                end
    
                # GAME PARTY VERIFICATION
                game = verify_party(player,opponent1,opponent2)
                if game == false
                    players_statut(player,opponent1,opponent2)
                    break
                end
    
                # OPPONENT 2 ATTACK
                if game == true && opponent2.life_points > 0
                    attacks(opponent2,player)
                end
            
                # STATUT PLAYERS
                players_statut(player,opponent1,opponent2)
            end
        end
        gameover(player,opponent1,opponent2)
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
        for i in 0..2
            sleep 0.2
            print "\e[1m  GO ! \e[22m"
        end
        puts
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

















    def is_still_ongoing?
        if @human_player.life_points == 0 && @enemies.length > 0
            return true
        else
            return false
        end
    end


    def show_players
        print "\n ETAT DU JOUEUR >> \n\n Life Point(s) > #{@human_player.life_points}\n"
        print "\n NUMBER OF ENEMIES > #{@enemies.length}\n\n"
    end

 

end