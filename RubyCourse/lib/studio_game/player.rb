require_relative "playable"
module StudioGame
  class Player
    attr_reader :health, :found_treasures
    attr_accessor :name
    include Playable

    def initialize(name, health = 100)
            @name = name.capitalize
            @health = health
            @found_treasures = Hash.new(0)
    end

    def found_treasure(name, points)
      @found_treasures[name] +=points 
    end

    def roll_die
        rand(1..6)
    end

    def to_s()
        return "I'm #{@name} with health = #{@health}, points = #{points}, and score = #{score}"
    end

    def drain()
        return @health -= 10
    end

    def points()
      return @found_treasures.values.sum
    end 

    def score()
        return @health + points
    end
    
    def boost()
      return @health += 15
    end

    def self.from_csv(line)
      name, health = line.split(",")
      Player.new(name, Integer(health))
      rescue ArgumentError
          puts "Ignored invalid health: #{health}"
          Player.new(name)
    end

    def to_csv()
      return "#{@name},#{score}"
    end


    def name=(new_name)
        @name = new_name.capitalize
    end

  end 

  if __FILE__ == $0
    player = Player.new("Player 1")
    puts player.name
  end
end