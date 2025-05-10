require_relative "treasure_trove"
require_relative "auditable"
module StudioGame
  class Game
    include Auditable
    Treasure = Data.define(:name, :points)

    # TREASURES = 
    # [
    #   Treasure.new("pie", 10),
    #   Treasure.new("coin", 25),
    #   Treasure.new("flute", 50),
    #   Treasure.new("compass", 65),
    #   Treasure.new("key", 80),
    #   Treasure.new("crown", 90),
    #   Treasure.new("star", 100)
    # ]

    attr_reader :title, :players
    attr_accessor :players


    def initialize(title)
        @title = title
        @players = []
    end

    def load(filename)

        File.readlines(filename, chomp: true).each do |line|
          player = Player.from_csv(line)
          add_player(player)
        end
      rescue Errno::ENOENT => e
        puts "whoops, this file does not exist!"
        exit 1
    end 

    def save(to_file = "player_rankings.csv")
      File.open(to_file, 'w') do |file|
        sorted_players.each do |player|
          file.puts player.to_csv
        end
      end
    end


    def add_player(player)
        @players.append(player)
    end

    def sorted_players()
      return @players.sort_by{|player| player.score}.reverse
    end 

    def roll_die()
        dye_numbers = [1,1,2,5,6,6]
        random_number = dye_numbers.sample
        audit(random_number)
        random_number
    end

    def print_stats()
      puts "\n Game Stats:"
      puts "-" * 30
      puts sorted_players
      @players.each do |player|
        puts "\n#{player.name}'s treasure point totals:"
        player.found_treasures.each do |name, points|
          puts "#{name}: #{points}"
        end
        puts "total : #{player.points}" 
      end

      puts "\nHigh Scores:"
      sorted_players.each do |player|
        points = player.score
        puts "#{player.name}................ #{points}"
      end

    end 

    def play(rounds = 1)
        puts "welcome the following players"

        puts "Here is a list of the treasures you may find!"

        # TreasureTrove::TREASURES.each do |treasure|
        #   puts "A #{treasure.name} is worth #{treasure.points} points"
        # end

        puts TreasureTrove.treasure_items

        puts @players
        1.upto(rounds) do |round|
          @players.each do |player|
              number_rolled = roll_die
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

              treasure = TreasureTrove.random_treasure
              player.found_treasure(treasure.name, treasure.points)
              puts "#{player} has found #{treasure.name} worth #{treasure.points} "
          end
        end

        puts "\nHere are the current scores after playing:"
        puts @players
    end

  end
end
