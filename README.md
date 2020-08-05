# ruby-oo-practice-project

Practice Deliverables #1

Patient

    Patient#initialize: should initialize with a name (string) and age (integer)

    Patient#name: should return the Patient’s name, should be able to change its name after creation

    Patient#age: should return the Patient’s age, should be able to change its age after creation

Doctor

    Doctor#initialize: should initialize with a name (string), specialty (string), and years (integer). Years should default to 1

    Doctor#name: should return the Doctor’s name, should be able to change its name after creation

    Doctor#speciality: should return the Doctor’s speciality, should NOT be able to change its speciality after creation

    Doctor#years: should return the Doctor’s years, should be able to change its years after creation

Practice Deliverables #2

Patient

    Patients should be initialized with an instance variable, impatience, set to 0
    
    Patient#increase_impatience: should be a private method that increases impatience by 1 
    
    Patient#inquire_appt_ready: should print that the doctor will be ready soon and increase patient impatience by 1
    
    Patient.all: should return a list of all patient instances

Doctor

    Doctor.all: should return a list of all doctor instances
    
    Doctor#greet: should print a greeting that would make any patient feel welcomed!

    Doctor.find_by_speciality: should take a specialty string as an argument and return a list of the doctors who have that specialty 