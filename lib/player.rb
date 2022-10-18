class Player
    attr_accessor :name, :life_points
    @name = ""
    @life_points = 0

    def initialize(name)
        @name = name
        @life_points = 10
    end

    def gets_damage(damage)
        @life_points -= damage
    end

    def showstate
        print "\e[42m \e[0m\e[36m     \e[1m#{@name}\e[22m\e[0m"
        x = @name.length
        x = 13-x 
        print " "*x
        if @life_points > 0
            print "    Life Points >  \e[32m\e[1m#{@life_points}\e[22m\e[0m"
        else
            print "    Life Points >  \e[31m\e[1m#{@life_points}\e[22m\e[0m"
        end
        str = @life_points.to_s
        x = str.length
        x = 5-x
        print " "*x
        print "\e[42m \e[0m\n"
    end
end

class HumanPlayer < Player
    attr_accessor :weapon_level, :is_in_life
    @weapon_level = 0

    def initialize(name)
        @weapon_level = 1
        super(name)
        @life_points = 100
    end

    def showstate
        print "\e[42m \e[0m\e[36m  \e[1m#{@name}\e[22m\e[0m"
        x = @name.length
        x = 16-x 
        print " "*x
        case @weapon_level
            when 1 then print "   WEAPON > \e[31m\e[1m#{@weapon_level}\e[22m\e[0m "
            when 2..4 then print "   WEAPON > \e[32m\e[1m#{@weapon_level}\e[22m\e[0m "
            when 5..6 then print "   WEAPON > \e[33m\e[1m#{@weapon_level}\e[22m\e[0m "
        end

        case @weapon_level
            when 1 then print "\e[31m▄\e[0m"
            when 2..4 then print "\e[32m▄\e[0m"*@weapon_level
            when 5..6 then print "\e[33m▄\e[0m"*@weapon_level
        end
        print "\e[30m▄\e[0m"*(6-@weapon_level)

        case @life_points
            when 0..24 then print "   LIFE > \e[31m\e[1m#{@life_points}\e[22m\e[0m"
            when 25..74 then print "   LIFE > \e[32m\e[1m#{@life_points}\e[22m\e[0m"
            when 75..100 then print "   LIFE > \e[33m\e[1m#{@life_points}\e[22m\e[0m"
        end
        str = @life_points.to_s
        x = str.length
        x = 4-x
        print " "*x
        
        bar = (@life_points/2).to_i
        case @life_points
            when 0..24 then print "\e[31m▄\e[0m"*bar
            when 25..74 then print "\e[32m▄\e[0m"*bar
            when 75..100 then print "\e[33m▄\e[0m"*bar
        end
        print "\e[30m▄\e[0m"*(50-bar)
        print "  \e[42m \e[0m\n"
    end

    def gets_damage(damage)
        @life_points -= (damage)
        @life_points = 0 if @life_points < 0
    end

    def search_weapon
        print "\nWEAPON SEARCH "
        for i in 0..30
            sleep 0.025
            print "."
        end
        x = rand(1..6)
        if x > @weapon_level
            @weapon_level = x
            print " NEW BEST WEAPON FOUND !! LEVEL \e[33m#{@weapon_level}\e[0m\n"
        else
            print " \e[31mNO BEST WEAPON FOUND\e[0m ... :( \n"
        end  
    end

    def search_health_pack
        print "\nSEARCH HEALTH PACK "
        for i in 0..30
            sleep 0.025
            print "."
        end
        x = rand(1..6)
        if x == 1
            print " \e[31mNOTHING FOUND\e[0m ... :( \n"
        elsif x > 1 && x < 6
            print " \e[33m[ \e[1m+ 50\e[22m ]\e[0m HEALTH PACKAGE FOUND !\n"
            @life_points = @life_points + 50
        elsif x == 6
            print " \e[33m[ \e[1m+ 80\e[22m ]\e[0m HEALTH PACKAGE FOUND !\n"
            @life_points = @life_points + 80
        end
        if @life_points > 100
            @life_points = 100
        end
    end
end