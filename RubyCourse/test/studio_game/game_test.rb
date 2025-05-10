require "minitest/autorun"

require_relative "../../lib/studio_game/game"
require_relative "../../lib/studio_game/player"
module StudioGame
  class GameTest < Minitest::Test

    def setup
      @game = Game.new("Test Me")

      @player_1 = Player.new("Player1",60)
      @player_2 = Player.new("Player2", 75)
      $stdout = StringIO.new
    end 


    def test_game_empty
      assert_equal @game.players.length, 0
    end

    def test_add_players
      @game.add_player(@player_1)
      @game.add_player(@player_2)


      refute_empty @game.players
      assert_equal [@player_1, @player_2], @game.players
    end 

    def test_boosts_the_player_if_a_high_number_is_rolled
      @game.add_player(@player_1)
    
      @game.stub(:roll_die, 6) do 
      @game.play
      assert_equal 75, @player_1.health
      end 
    end

    def test_skips_the_player_if_a_medium_number_is_rolled
      @game.add_player(@player_1)

      @game.stub(:roll_die, 3) do   
        @game.play
        assert_equal @player_1.health, 60
      end 
    end

    def test_drains_the_player_if_a_low_number_is_rolled
      @game.add_player(@player_1)

      @game.stub(:roll_die, 1) do 
        @game.play
        assert_equal @player_1.health, 50
      end
    end 


  end
end