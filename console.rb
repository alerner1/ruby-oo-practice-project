require_relative('app/models/doctor.rb')
require_relative('app/models/patient.rb')
require 'pry'

Doctor.new("Luke Voit", "GI", 3)
Doctor.new("Aaron Judge", "PCP", 4)
Doctor.new("Gerrit Cole", "PCP", 17)
Doctor.new("Chad Green", "oncology", 12)
Doctor.new("Gary Sanchez", "OBGYN", 8)

Patient.new("Jeffrey Springs", 28)
Patient.new("Kevin Plawecki", 29)
Patient.new("Xander Bogaerts", 28)
Patient.new("Kevin Pillar", 31)




binding.pry