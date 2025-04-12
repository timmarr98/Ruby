puts "goonies has a rank of 10"


# String interpolation #{Variable}
#Double quoted string necessary when utilizint string interpolation
# Single quote strings are for raw strings ONLY 
 
class Movie

    attr_reader :title, :rank 
    attr_writer :title, :rank
    def initialize(title,rank = 5)
        @title = title.capitalize
        @rank = rank
    end

    def info
        "#{@title} has a rank of #{@rank}"
    end
end

class 


movie_1 = Movie.new("May", 5)
puts movie_1.info
puts movie_1.title
puts movie_1.rank
movie_1.title = "New title"
puts movie_1.title

movie_2 = Movie.new("Shrek", 12)
puts movie_2.info

movie_3 = Movie.new("bloop")
puts movie_3.info