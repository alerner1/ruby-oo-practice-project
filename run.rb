require_relative('app/models/doctor.rb')
require_relative('app/models/patient.rb')
require 'pry'

# allows user to add a new entry or exit the program
def welcome_screen
    puts "Welcome to the office filing system!"
    puts "To add a doctor or patient entry, type 'new entry'."
    puts "To exit, type 'exit'."
    
    task = gets.chomp
    case task
    when "new entry"
        category = person_type
        
        if category == 'doctor'
            create_doctor
        elsif category == 'patient'
            create_patient
        else
            invalid_input
        end
    when "exit"
        exit
    else
        invalid_input
    end

end

# choose which class you want
def person_type
    puts "What category would you like to input? (Choose 'doctor' or 'patient'.)"
    gets.chomp
end

#creates a new instance of Doctor
def create_doctor
    doctor_info = get_input("doctor", ["name", "specialty", "number of years in practice"])
    
    # since creating the new Doctor instance this way screws up the default value requirement for number of years
    if doctor_info[2] == ""
        doctor_info[2] = 1
    end

    doctor = Doctor.new(doctor_info[0], doctor_info[1], doctor_info[2])
    
    print_info(doctor)
    option_to_change(doctor)
    puts "To see who has signed in, type 'list'. To return to the welcome screen, type 'exit'."

    see_list(doctor)
end

# creates a new instance of Patient
def create_patient
    patient_info = get_input("patient", ["name", "age"])
    patient = Patient.new(patient_info[0], patient_info[1])
    
    print_info(patient)
    Doctor.greet
    option_to_change(patient)
    puts "To check if the doctor is ready, type 'schedule'. To see who has signed in, type 'list'."
    puts "To return to the welcome screen, type 'exit'."

    next_step = gets.chomp
    case next_step
    when "schedule"
        patient.inquire_appt_ready
        puts "Press the Enter key to return to the welcome screen."
        gets.chomp
        welcome_screen
    when "list"
        see_list(patient)
    else
        invalid_input
    end
end

# gets initial information about object from user
def get_input(category, infotype_list)
    person_info = []
    
    infotype_list.each do |element|
        puts "What is the #{category}'s #{element}?"
        person_info << gets.chomp
    end
    person_info
end

# prints information about this object
def print_info(class_object)
    if class_object.is_a?(Doctor)
        puts "The Doctor is #{class_object.name}, a specialist in #{class_object.specialty}, practicing for #{class_object.years} years."
    elsif class_object.is_a?(Patient)
        puts "The patient is #{class_object.name} and they are #{class_object.age} years old."
    else 
        invalid_input
    end
end

# user can decide to change information or store as-is
def option_to_change(class_object)
    
    puts "Would you like to change any of your information? (y/n)"
    
    change = gets.chomp
    if change == "y"
        change_info(class_object)
    else
        puts "OK, your information has been stored."
    end
end

# input changed information and modify object accordingly
def change_info(class_object)
    puts "What information would you like to change?"
    puts "For doctor: choose 'name' or 'years'."
    puts "For patient: choose 'name' or 'age'."

    subcat = gets.chomp

    puts "What is the new #{subcat} information?"
    
    new_info = gets.chomp
    
    # can't just use class_object.subcat because it's a string, not a method name
    # so we have to figure out which method to call manually
    case subcat
    when "name"
        class_object.name = new_info
    when "age"
        class_object.age = new_info
    when "specialty"
        puts "Sorry, you can't change the specialty!"
        invalid_input
        exit
    when "years"
        class_object.years = new_info
    else
        invalid_input
        exit
    end

    print_info(class_object)
    option_to_change(class_object)
    
end

# ONLY DOCTORS can see a list of patients. Both can see a list of doctors.
def see_list(person_type)

    puts "Which list would you like to see? Choose 'doctor' or 'patient'."
    list_choice = gets.chomp
    
    # I know some of this list printing could be done more succinctly but it's tough to do without messing with the deliverables
    if list_choice == "doctor"
        doctor_list = Doctor.all
        
        doctor_list.each do |doctor|
            puts "Name: #{doctor.name}, Specialty: #{doctor.specialty}, Years in practice: #{doctor.years}"
        end
        
        puts "Would you like to search for doctors with a particular specialty? (y/n)"
        see_specialties = gets.chomp

        if see_specialties == "y"
            puts "Which specialty?"
            specialty = gets.chomp
            doctor_sublist = Doctor.find_by_specialty(specialty)
            
            doctor_sublist.each do |doctor|
                puts "Name: #{doctor.name}, Specialty: #{doctor.specialty}, Years in practice: #{doctor.years}"
            end
        elsif see_specialties == "n"
            welcome_screen
        else
            invalid_input
        end

    elsif list_choice == "patient"
        if person_type.is_a?(Patient)
            puts "Sorry! As a patient, you do not have access to the list of other patients."
        else
            patient_list = Patient.all
            
            patient_list.each do |patient|
                puts "Name: #{patient.name}, Age: #{patient.age}"
            end
        end
    else
        invalid_input
    end

    puts "When you are ready to return to the welcome screen, push the Enter key."
    gets.chomp
    welcome_screen

end

# the user did something wrong (doesn't account for all possible invalid inputs, just the obvious ones that would really break the program)
def invalid_input
    puts "Sorry, that input was invalid. Please restart the program."
    exit
end

# order of operations when you run the program
def run
    welcome_screen
end

run