class Patient
    attr_accessor :room, :name, :last_name, :cured
    attr_accessor :id

    def initialize(attr = {})
      @name = attr[:name]
      @last_name = attr[:last_name]
      @cured = false
      @room = nil
    end
end

