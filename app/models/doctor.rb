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

    def greet
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

    def appointments
        Appointment.all.filter do |appointment|
            appointment.doctor == self
        end
    end

    # NOTE: assuming "associated with this patient" was a typo in the readme 
    # and it was supposed to say "associated with this doctor"
    def patients
        my_patients = self.appointments.map do |appointment|
            appointment.patient
        end  

        my_patients.uniq
    end


    # def patients # returns an array of all the patients for this doctor
    #     Patient.all.select do |patient|
    #         patient.doctor == self
    #     end
    # end

    # def discharge_patient(patient) # assuming "dischange" from the readme was a typo
    #     if patient.doctor == self # changes patient's doctor to nil but only if they are the current doctor's patient
    #         patient.change_doctors=(nil)
    #     end
    # end

    # def transfer_patient(patient, new_doctor) # works!
    #     if patient.doctor == self
    #         patient.change_doctors = new_doctor
    #     end

    # end
end