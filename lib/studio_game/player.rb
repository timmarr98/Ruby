class Player
  attr_reader :health
  attr_accessor :name
  

  def initialize(name, health = 100)
          @name = name.capitalize
          @health = health
  end

  def roll_die
       rand(1..6)
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

if __FILE__ == $0
  player = Player.new("Player 1")
  puts player.name
end