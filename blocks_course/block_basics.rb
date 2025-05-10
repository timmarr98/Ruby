puts "Let's start mastering Ruby blocks!"


3.times do 
	puts "this 3 times"
end


1.upto(3) {|n| puts "#{n} Echo!"}


# Start by using the times method with a block to print the following workout steps, 5 times:
5.times do 
    puts "situp"
    puts "pushup"
    puts "chinup"
end


# 0 situp
# 0 pushup
# 0 chinup
5.times do |number|
    puts "#{number} situp"
    puts "#{number} pushup"
    puts "#{number} chinup"
end


1.upto(5) do |number|
    puts "#{number} situp"
    puts "#{number} pushup"
    puts "#{number} chinup"
end

1.step(9,2) do |number|
    puts "#{number} situp"
    puts "#{number} pushup"
    puts "#{number} chinup"
end
