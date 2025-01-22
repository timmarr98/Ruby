puts "goonies has a rank of 10"


# String interpolation #{Variable}
#Double quoted string necessary when utilizint string interpolation
# Single quote strings are for raw strings ONLY 
 
class Movie
    def initialize(title,rank = 5)
        @title = title.capitalize
        @rank = rank
    end

    def info
        "#{@title} has a rank of #{@rank}"
    end
end

movie_1 = Movie.new("May", 5)
puts movie_1.info

movie_2 = Movie.new("Shrek", 12)
puts movie_2.info

movie_3 = Movie.new("bloop")
puts movie_3.info