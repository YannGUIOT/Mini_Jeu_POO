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

        if @life_points > 0
            print "   LP >  \e[32m\e[1m#{@life_points}\e[22m\e[0m"
        else
            print "   LP >  \e[31m\e[1m#{@life_points}\e[22m\e[0m"
        end
        str = @life_points.to_s
        x = str.length
        x = 5-x
        print " "*x
        if @weapon_level > 1
            print " WL >  \e[33m\e[1m#{@weapon_level}\e[22m\e[0m  "
        else
            print " WL >  \e[32m\e[1m#{@weapon_level}\e[22m\e[0m  "
        end
        print "\e[42m \e[0m\n"
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