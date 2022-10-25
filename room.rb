class Room
    attr_reader :patients

    def initialize(attr = {})
      @capacity = attr[:capacity] || 0
      @patients = attr[:patients] || []
    end

    def add_patient(patient)
        if @capacity == @patients.count        
            raise StandardError, "Too many patients!!!"
        else
            patient.room = self
            @patients << patient
        end
    end
end
