require 'csv'

class PatientRepo
    attr_accessor :patients
    def initialize(csv_file)
        @csv_file = csv_file
        @patients = []
        load_csv
        @next_id = @patients.empty? ? 1 : @patients.last.id.to_i + 1
    end

    def add_patient(patient)
        patient.id = @next_id
        @next_id += 1
        @patients << patient
        save_csv
    end

    private

    def save_csv
        CSV.open(@csv_file, "wb") do |csv|
            csv << ["id", "name", "last_name", "cured", "room_id"]
            @patients.each do |patient|
                csv << [patient.id, patient.name, patient.last_name, patient.cured, patient.room]
            end
        end
    end
    
    def load_csv
        CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
            patient = Patient.new(name: row[:name], last_name: row[:last_name], id: row[:id].to_i, cured: row[:cured])
            patient.room = row[:patient_id]
            @patients << Patient.new(name: row[:name], last_name: row[:last_name], id: row[:id].to_i, cured: row[:cured], room: row[:room])
        end
    end
end
