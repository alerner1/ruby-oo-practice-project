require_relative('app/models/doctor.rb')
require_relative('app/models/patient.rb')
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




binding.pry