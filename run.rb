require_relative('app/models/doctor.rb')
require_relative('app/models/patient.rb')
require 'pry'

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
end

# creates a new instance of Patient
def create_patient
    patient_info = get_input("patient", ["name", "age"])
    patient = Patient.new(patient_info[0], patient_info[1])
    
    print_info(patient)
    option_to_change(patient)
end

# user can decide to change information or quit the program
def option_to_change(class_object)
    
    puts "Would you like to change any of this information? (y/n)"
    
    change = gets.chomp
    if change == "y"
        change_info(class_object)
    else
        puts "Thanks for using this program!"
    end
end

# input new information and modify object accordingly
def change_info(class_object)
    puts "What information would you like to change?"
    puts "For doctor: choose 'name', 'specialty', or 'years'."
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
        class_object.specialty = new_info
    when "years"
        class_object.years = new_info
    else
        invalid_input
        exit
    end

    print_info(class_object)
    option_to_change(class_object)
    
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

# gets initial information about object from user
def get_input(category, infotype_list)
    person_info = []
    
    infotype_list.each do |element|
        puts "What is the #{category}'s #{element}?"
        person_info << gets.chomp
    end
    person_info
end

# the user did something wrong (doesn't account for all possible invalid inputs, just the obvious ones that would really break the program)
def invalid_input
    puts "Sorry, that input was invalid. Please restart the program."
end

# order of operations when you run the program
def run
    category = person_type
    if category == 'doctor'
        create_doctor
    elsif category == 'patient'
        create_patient
    else
        invalid_input
    end
end

run