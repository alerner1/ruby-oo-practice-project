# ruby-oo-practice-project

Note that the CLI has not been updated for deliverables #3! 
(Might do it for #4 if time, we'll see.)


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

Practice Deliverables #3

Associations:

    A Patient should belong to a Doctor # DONE
    
    A Doctor can have many Patients # DONE

Patient
    
    Patient#doctor should return the Doctor instance for this patient # DONE
    
    Patient#change_doctors should take a doctor instance and update the patient’s doctor # DONE

Doctor

    Doctor#patients should return an array of all the Patients for that doctor # DONE

    Doctor#dischange_patient should set a patient’s doctor to nil, only if the patient belongs to the current doctor # DONE

    Doctor#transfer_patient should change a patient’s doctor to another doctor. This should only work if the patient belongs to the current doctor. # DONE