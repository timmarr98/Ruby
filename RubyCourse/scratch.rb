# 1.upto(10) do |number|
#   puts "howdy"
# end

10.times do 
  puts "howdy"
end

5.upto(8) do |number|
  puts "alligator #{number}"
end

3.downto(1) do |number|
  puts "launch in #{number}"
end

words = %w[dog zebra elephant chimpanzee]
words.each do |word|
  puts word.length
end

