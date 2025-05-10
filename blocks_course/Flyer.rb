class Flyer
    attr_reader :name, :email, :miles_flown
  
    def initialize(name, email, miles_flown)
      @name = name
      @email = email
      @miles_flown = miles_flown
    end
  
    def to_s
      "#{name} (#{email}): #{miles_flown}"
    end
  end


flyers = []
1.upto(5) do |flyer|
    flyers << Flyer.new("Flyer #{flyer}", "flyer#{flyer}@example.com", flyer*1000)
end

puts flyers