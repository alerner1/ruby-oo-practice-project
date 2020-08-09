require 'pry'
class Patient
    attr_accessor :name, :age, :impatience
    # attr_reader :doctor 

    @@all = []

    def initialize(name, age) 
                                            
        @name = name
        @age = age
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

    def appointments
        Appointment.all.filter do |appointment|
            appointment.patient == self
        end
    end

    def doctors
        my_doctors = self.appointments.map do |appointment|
            appointment.doctor
        end

        my_doctors.uniq
    end

    def create_appointment(doctor)
        Appointment.new(doctor, self)
    end

    # def change_doctors=(doctor) # works!
    #     @doctor = doctor
    # end

    private

    def increase_impatience
        self.impatience += 1
    end
end