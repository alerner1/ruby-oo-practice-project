class Doctor
    attr_accessor :name, :years
    attr_reader :specialty
    
    @@all = []

    def initialize(name, specialty, years = 1)
        @name = name
        @specialty = specialty
        @years = years
        
        self.class.all << self
    end

# NOTE: I know this was supposed to be an instance method! But it wouldn't work with my CLI that way (the patients are the ones who 
# see the greeting, not the doctors!), so I added the "self.".
# I can change it back once we get the next set of deliverables.
    def self.greet
        puts "Welcome! We're so glad you're here. You're in good hands." 
    end

    def self.all
        @@all
    end

    def self.find_by_specialty(specialty)
        self.all.select do |doctor|
            doctor.specialty == specialty
        end
    end

end