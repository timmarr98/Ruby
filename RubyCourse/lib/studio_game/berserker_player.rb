require_relative "player"
module StudioGame
    class BerserkPlayer < Player
        def initialize(name, player)
            super(name, player)
            @boost_count =  0
        end

        #The question mark means that it is a boolean and return true/false
        def berserk?
        @boost_count > 5
        end

        def boost()
            super()
            @boost_count += 1
            puts "#{name} is beserk!" if berserk?
        end

        def drain()
            if berserk?
                boost()
            else
                super()
            end
        end
            

    end
    

if __FILE__ == $0
    berserker = BerserkPlayer.new("berserker", 50)
    6.times { berserker.boost }
    2.times { berserker.drain }
    puts berserker.health
  end
end