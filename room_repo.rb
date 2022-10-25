require 'csv'

class RoomRepo
    attr_accessor :rooms
    def initialize(csv_file)
        @csv_file = csv_file
        @rooms = []
        load_csv
        @next_id = @rooms.empty? ? 1 : @rooms.last.id.to_i + 1
    end

    def add_room(room)
        room.id = @next_id
        @next_id += 1
        @rooms << room
        save_csv
    end

    private

    def save_csv
        CSV.open(@csv_file, "wb") do |csv|
            csv << ["id", "capacity"]
            @rooms.each do |room|
                csv << [room.id, room.capacity]
            end
        end
    end
    
    def load_csv
        CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
            @rooms << Room.new(capacity: row[:capacity], id: row[:id].to_i)
        end
    end
end
