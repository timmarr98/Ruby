puts "Let's play a game!\n\t3\n\t2\n\t1"

player_health = 60
player_name = "finn"

string = "#{player_name.capitalize.ljust(20, ".")}'s health is #{player_health/9.0}"
puts string

# reverse an integer

puts player_health.pow(2)


def my_method(name:, health: 100)
    puts "I'm #{name.capitalize} with a health of #{health}"
end

my_method( name: "Sonic")
my_method(health:3, name: "Shadow")
my_method(health:0, name: "Metal Sonic")

