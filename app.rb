require_relative "patient.rb"
require_relative "room.rb"
require_relative "patient_repo.rb"

repo = PatientRepo.new("patients.csv")
patient = Patient.new(name: "Nui", last_name: "asasdasd")
patient.room = 3
patient_one = Patient.new(name: "Joao", last_name: "asasdasd")
# patient_two = Patient.new(name: "Danko", last_name: "asasdasd")
repo.add_patient(patient)
repo.add_patient(patient_one)
p repo.patients
# room = Room.new(capacity: 2)

# room.add_patient(patient)
# room.add_patient(patient_one)

