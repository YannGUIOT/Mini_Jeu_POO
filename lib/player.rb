class Player
    attr_accessor :name, :life_points
    @name = ""
    @life_points = 0

    def initialize(name)
        @name = name
        @life_points = 10
    end

    def show_state
        puts "  #{@name} -> Life Points : #{@life_points}"
    end

    def gets_damage(damage)
        @life_points -= damage
    end
end