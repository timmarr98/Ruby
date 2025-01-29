class Player
    attr_reader :health
    attr_accessor :name
    

    def initialize(name, health = 100)
            @name = name.capitalize
            @health = health
    end

    def to_s()
        return "I'm #{@name} with a health of #{@health} and a score of #{score()}"
    end

    def drain()
        return @health -= 10
    end

    def score()
        return @health + @name.length 
    end
    
    def boost()
        return @health += 15
    end

    def name=(new_name)
        @name = new_name.capitalize
    end

end  

# number_rolled = rand(1..6)
# puts number_rolled
player1 = Player.new("Player #1", health = 20)
# puts player1


player2 = Player.new("Player #2")
# puts player2
# puts player2.health
# puts player2.name

player3 = Player.new("Player #3", health = 0)
player4 = Player.new("Player #4", health = 100)
player5 = Player.new("Cole", health = 75)
# puts player3
# puts player3.health
# player3.name = "new Player #3"
# puts player3.name
# puts player3.score

players = [player1, player2, player3, player4]
players.pop
players.push(player5)
puts "before playing"
puts players


players.each do |player|
    number_rolled = rand(1..6)
    puts number_rolled
    case number_rolled 
    when 1..2
        player.drain()
        puts "#{player.name} got drained"
    when 3..4
        puts "#{player.name} got skipped"
    else
        player.boost()
        puts "#{player.name} got boosted"
    end
end

puts "\nafter playing"
puts players











