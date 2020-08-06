require 'pry'
class Patient
    attr_accessor :name, :age, :impatience
    attr_reader :doctor # patient now belongs to a doctor. accessor allows for returning patient's doctor when patient.doctor is called. it's a reader method since writer is custom.

    @@all = []

    def initialize(name, age, doctor = nil) # assuming patients are initialized with a doctor? default value of nil if not. 
                                            # works!
        @name = name
        @age = age
        @doctor = doctor
        @impatience = 0

        self.class.all << self
    end

    def inquire_appt_ready
        puts "The doctor will be ready soon!"
        increase_impatience
    end

    def self.all
        @@all
    end

    def change_doctors=(doctor) # works!
        @doctor = doctor
    end

    private

    def increase_impatience
        self.impatience += 1
    end
end