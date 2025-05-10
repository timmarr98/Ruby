require "minitest/autorun"

require_relative "../../lib/studio_game/player"
module StudioGame
  class PlayerTest < Minitest::Test

    # test methods go here

    def test_has_a_capitalized_name
      player1 = Player.new("player1", 60)

      assert_equal "Player1", player1.name
    end

    def test_initial_health_check
      player1 = Player.new("player1", 56)

      assert_equal 56, player1.health
    end

    def test_score_check
      player1 = Player.new("player1", 40)

      assert_equal 47, player1.score()
    end

    def test_to_string_method
      player1 = Player.new("tails",40)

      assert_equal "I'm Tails with a health of 40 and a score of 45", player1.to_s()
    end

    def test_health_boost
      player1 = Player.new("beyonce", 20)

      player1.boost()

      assert_equal player1.health, 35
    end

    def test_health_drain
      player1 = Player.new("bjork" , 30)

      player1.drain()

      assert_equal player1.health, 20
    end
  end
end