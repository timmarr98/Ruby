class Player
    def initialize(name, health = 100)
            @name = name.capitalize
            @health = health
    end

    def to_s()
        return "I'm #{@name} with a health of #{@health}"
    end

    def drain()
        return @health -= 10
    end
    
    def boost()
        return @health += 15
    end
end  

player1 = Player.new("Player #1", health = 20)
puts player1
player1.drain()
puts player1
player1.boost()
puts player1



player2 = Player.new("Player #2")
puts player2

player3 = Player.new("Player #3", health = 0)
puts player3

