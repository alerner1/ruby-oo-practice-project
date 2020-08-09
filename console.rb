require_relative('app/models/doctor.rb')
require_relative('app/models/patient.rb')
require_relative('app/models/appointment.rb')
require 'pry'

luuuke = Doctor.new("Luke Voit", "GI", 3)
best  = Doctor.new("Aaron Judge", "PCP", 4)
cole = Doctor.new("Gerrit Cole", "PCP", 17)
green = Doctor.new("Chad Green", "oncology", 12)
gary = Doctor.new("Gary Sanchez", "OBGYN", 8)

springs = Patient.new("Jeffrey Springs", 28)
plawecki = Patient.new("Kevin Plawecki", 29)
xander = Patient.new("Xander Bogaerts", 28)
pillar = Patient.new("Kevin Pillar", 31)

springs.create_appointment(luuuke)
springs.create_appointment(best)
plawecki.create_appointment(luuuke)
plawecki.create_appointment(luuuke)
xander.create_appointment(best)
xander.create_appointment(best)
pillar.create_appointment(gary)