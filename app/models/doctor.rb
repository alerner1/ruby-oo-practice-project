class Doctor
    attr_accessor :name, :specialty, :years

    def initialize(name, specialty, years = 1)
        @name = name
        @specialty = specialty
        @years = years
    end

end