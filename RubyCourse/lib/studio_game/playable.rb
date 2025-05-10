module StudioGame
    module Playable

        def drain()
            return @health -= 10
        end

        def boost()
            return @health += 15
        end
    end
end