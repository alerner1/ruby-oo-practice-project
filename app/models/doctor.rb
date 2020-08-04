class Doctor
    attr_accessor :name, :years
    attr_reader :specialty


    def initialize(name, specialty, years = 1)
        @name = name
        @specialty = specialty
        @years = years
    end

end