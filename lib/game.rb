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

    def enemies_attack
    end

    def menu_choice
    end
 
end